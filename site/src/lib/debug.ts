const enabled = process.env.NODE_ENV !== "production";

/** Development-only console logger with a scope prefix. */
export const debug = (scope: string, ...args: unknown[]) => {
  if (!enabled) return;
  console.log(`[${scope}]`, ...args);
};
