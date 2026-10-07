import type { ElementType } from "react";

type HeadingProps = {
  as?: ElementType;
  text: string;
  className?: string;
  hero?: boolean;
  /** "auto" reveals on scroll; "manual" leaves the words hidden for a custom timeline */
  reveal?: "auto" | "manual";
};

/** Splits text into masked words for the reveal. `_words_` render as italic accents, `\n` forces a line break. */
const Heading = ({ as: Tag = "h2", text, className = "", hero = false, reveal = "auto" }: HeadingProps) => {
  const plain = text.replace(/_/g, "").replace(/\n/g, " ");
  const lines = text.split("\n");
  const revealAttr = reveal === "auto" ? { "data-split": "" } : { "data-split-manual": "" };
  let key = 0;

  return (
    <Tag className={`display ${className}`} aria-label={plain} data-hero={hero ? "" : undefined} {...revealAttr}>
      {lines.map((line, lineIndex) => (
        <span key={`l${lineIndex}`} aria-hidden="true" className={lines.length > 1 ? "block" : undefined}>
          {line.split(/(_[^_]+_)/).filter(Boolean).flatMap((part) => {
            const em = part.startsWith("_");
            return part.replace(/_/g, "").split(/\s+/).filter(Boolean).map((word) => (
              <span key={key++}>
                <span className="word-mask"><span className="word">{em ? <em>{word}</em> : word}</span></span>{" "}
              </span>
            ));
          })}
        </span>
      ))}
    </Tag>
  );
};

export default Heading;
