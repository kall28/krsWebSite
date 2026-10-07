// Renders the hero ribbon sculpture from a parametric 3D surface into two image layers.
// The headline is treated as a plane tilted by PLANE_TILT: faces on the camera side go to the
// front layer (drawn over the text), the rest to the back layer. Any plane keeps occlusion
// consistent, because each line of sight crosses it once.
// Run: npm run sculpture
import { createHash } from "node:crypto";
import { mkdirSync, readdirSync, rmSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import sharp from "sharp";

const ROOT = join(dirname(fileURLToPath(import.meta.url)), "..");
const OUT = join(ROOT, "public", "hero");
const MANIFEST = join(ROOT, "src", "lib", "sculpture.ts");
const U = 900;
const V = 28;
const DEPTH_SPLIT = Number(process.env.SPLIT ?? 1.1);
const PLANE_TILT = Number(process.env.TILT ?? 2);
const PLANE_TILT_X = Number(process.env.TILT_X ?? 0.4);
const SIZE = 1000;
const EXPORT_WIDTH = 1600;

const palette = {
  deep: [10, 20, 58],
  cyan: [72, 198, 224],
  ivory: [244, 239, 228],
  slate: [38, 52, 98],
};

const add = (a, b) => a.map((x, i) => x + b[i]);
const sub = (a, b) => a.map((x, i) => x - b[i]);
const mul = (a, s) => a.map((x) => x * s);
const dot = (a, b) => a.reduce((s, x, i) => s + x * b[i], 0);
const cross = (a, b) => [a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0]];
const norm = (a) => mul(a, 1 / (Math.hypot(...a) || 1));
const mix = (a, b, t) => a.map((x, i) => x + (b[i] - x) * t);
const clamp = (x) => Math.min(1, Math.max(0, x));
const hex = (c) => "#" + c.map((x) => Math.round(Math.min(255, Math.max(0, x))).toString(16).padStart(2, "0")).join("");

const rot = (p, [ax, ay, az]) => {
  let [x, y, z] = p;
  [y, z] = [y * Math.cos(ax) - z * Math.sin(ax), y * Math.sin(ax) + z * Math.cos(ax)];
  [x, z] = [x * Math.cos(ay) + z * Math.sin(ay), -x * Math.sin(ay) + z * Math.cos(ay)];
  [x, y] = [x * Math.cos(az) - y * Math.sin(az), x * Math.sin(az) + y * Math.cos(az)];
  return [x, y, z];
};
const VIEW = [(-58 * Math.PI) / 180, (16 * Math.PI) / 180, (-22 * Math.PI) / 180];

// Wavy loop with three full twists and a tapering width
const surface = (u, v) => {
  const r = 1 + 0.16 * Math.sin(3 * u);
  const centre = [r * Math.cos(u), 0.92 * r * Math.sin(u), 0.34 * Math.sin(2 * u + 0.6)];
  const radial = [Math.cos(u), Math.sin(u), 0];
  const twist = 3 * u + 0.4;
  const band = add(mul(radial, Math.cos(twist)), mul([0, 0, 1], Math.sin(twist)));
  const width = 0.28 * (0.6 + 0.4 * Math.cos(2 * u - 0.9));
  return rot(add(centre, mul(band, v * width)), VIEW);
};

const CAMERA = 7;
const project = ([x, y, z]) => {
  const f = CAMERA / (CAMERA - z);
  return [x * f, -y * f];
};

const LIGHT = norm([-0.45, 0.75, 0.8]);
const HALF = norm(add(LIGHT, [0, 0, 1]));

const faces = [];
for (let i = 0; i < U; i++) {
  for (let j = 0; j < V; j++) {
    const u0 = (i / U) * Math.PI * 2, u1 = ((i + 1) / U) * Math.PI * 2;
    const v0 = -1 + (2 * j) / V, v1 = -1 + (2 * (j + 1)) / V;
    const quad = [surface(u0, v0), surface(u1, v0), surface(u1, v1), surface(u0, v1)];
    const um = (u0 + u1) / 2, vm = (v0 + v1) / 2, e = 1e-4;
    const n = norm(cross(sub(surface(um + e, vm), surface(um - e, vm)), sub(surface(um, vm + e), surface(um, vm - e))));
    const outer = n[2] >= 0;
    const facing = outer ? n : mul(n, -1);
    const diffuse = clamp(dot(facing, LIGHT));
    const spec = Math.pow(clamp(dot(facing, HALF)), 70);
    const rim = Math.pow(1 - Math.abs(facing[2]), 3);
    const base = outer
      ? mix(palette.deep, palette.cyan, 0.14 + 0.7 * Math.pow(diffuse, 1.3))
      : mix(palette.slate, palette.ivory, Math.pow(diffuse, 1.4));
    const lit = add(add(base, mul(palette.ivory, spec * (outer ? 0.85 : 0.55))), mul(palette.cyan, rim * 0.22));
    const depth = quad.reduce((s, p) => s + p[2], 0) / 4;
    const across = quad.reduce((s, p) => s + p[0], 0) / 4;
    const height = quad.reduce((s, p) => s + p[1], 0) / 4;
    const plane = depth - PLANE_TILT * height + PLANE_TILT_X * across;
    faces.push({ pts: quad.map(project), depth, front: plane > DEPTH_SPLIT, fill: hex(lit) });
  }
}

const all = faces.flatMap((f) => f.pts);
const minX = Math.min(...all.map((p) => p[0])), maxX = Math.max(...all.map((p) => p[0]));
const minY = Math.min(...all.map((p) => p[1])), maxY = Math.max(...all.map((p) => p[1]));
const scale = (SIZE * 0.96) / Math.max(maxX - minX, maxY - minY);
const w = Math.round((maxX - minX) * scale + SIZE * 0.04), h = Math.round((maxY - minY) * scale + SIZE * 0.04);
const toView = ([x, y]) => [((x - minX) * scale + SIZE * 0.02).toFixed(1), ((y - minY) * scale + SIZE * 0.02).toFixed(1)];

const path = (f) => {
  const [a, b, c, d] = f.pts.map(toView);
  return `<path d="M${a}L${b}L${c}L${d}Z" fill="${f.fill}" stroke="${f.fill}"/>`;
};
const svg = (list) =>
  `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${w} ${h}" width="${w}" height="${h}"><g stroke-width="0.9" stroke-linejoin="round">${list.map(path).join("")}</g></svg>`;

faces.sort((a, b) => a.depth - b.depth);
const back = faces.filter((f) => !f.front);
const front = faces.filter((f) => f.front);

// Content-hashed names so a regenerated sculpture is never served from a stale cache
const exportLayer = async (name, list) => {
  const { data, info } = await sharp(Buffer.from(svg(list)), { density: (72 * EXPORT_WIDTH) / w })
    .resize({ width: EXPORT_WIDTH })
    .webp({ quality: 82, alphaQuality: 90, effort: 6 })
    .toBuffer({ resolveWithObject: true });
  const file = `ribbon-${name}.${createHash("sha1").update(data).digest("hex").slice(0, 8)}.webp`;
  writeFileSync(join(OUT, file), data);
  console.log(`[sculpture] ${name}: ${list.length} faces, ${info.width}x${info.height}, ${(data.length / 1024).toFixed(1)} KB -> ${file}`);
  return { src: `/hero/${file}`, width: info.width, height: info.height };
};

mkdirSync(OUT, { recursive: true });
readdirSync(OUT).filter((f) => f.startsWith("ribbon-")).forEach((f) => rmSync(join(OUT, f)));
const backLayer = await exportLayer("back", back);
const frontLayer = await exportLayer("front", front);

writeFileSync(
  MANIFEST,
  `// Generated by scripts/sculpture.mjs. Do not edit by hand.\nexport const sculpture = ${JSON.stringify({ width: backLayer.width, height: backLayer.height, back: backLayer.src, front: frontLayer.src }, null, 2)} as const;\n`,
);
console.log(`[sculpture] manifest -> ${MANIFEST}`);
