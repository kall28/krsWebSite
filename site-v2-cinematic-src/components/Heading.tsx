import type { ElementType } from "react";

/** Splits text into masked words for the staggered reveal. `_word_` marks italic accent words. */
export default function Heading({
  as: Tag = "h2", text, className = "", hero = false,
}: { as?: ElementType; text: string; className?: string; hero?: boolean }) {
  const plain = text.replace(/_/g, "");
  const parts = text.split(/(_[^_]+_)/).filter(Boolean);
  let key = 0;
  return (
    <Tag className={`display ${className}`} aria-label={plain} data-split data-hero={hero ? "" : undefined}>
      {parts.flatMap((part) => {
        const em = part.startsWith("_");
        return part.replace(/_/g, "").split(/\s+/).filter(Boolean).map((w) => (
          <span key={key++} aria-hidden="true">
            <span className="word-mask"><span className="word">{em ? <em>{w}</em> : w}</span></span>{" "}
          </span>
        ));
      })}
    </Tag>
  );
}

/** Body statement whose words light up as you scroll through it. */
export function Statement({ text, className = "" }: { text: string; className?: string }) {
  return (
    <p className={`display ${className}`} data-words aria-label={text}>
      {text.split(" ").map((w, i) => <span key={i} data-w aria-hidden="true">{w} </span>)}
    </p>
  );
}
