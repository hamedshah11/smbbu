export type PageSection = {
  id: string;
  title: string;
  /** Markdown chunk including its own `## Title` heading line. */
  content: string;
};

export function slugify(text: string): string {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

/**
 * Split a markdown body into the intro (content before the first h2) and one
 * chunk per `## ` section, so the template can wrap each section for the
 * on-page nav and scroll animations.
 */
export function splitSections(body: string): { intro: string; sections: PageSection[] } {
  const lines = body.split("\n");
  const sections: PageSection[] = [];
  let intro = "";
  let current: PageSection | null = null;
  let buffer: string[] = [];

  const flush = () => {
    const content = buffer.join("\n").trim();
    if (current) {
      current.content = content;
      if (content) sections.push(current);
    } else {
      intro = content;
    }
    buffer = [];
  };

  for (const line of lines) {
    const match = /^## (.+)$/.exec(line);
    if (match) {
      flush();
      current = { id: slugify(match[1]), title: match[1].trim(), content: "" };
    }
    buffer.push(line);
    if (match) buffer = [line];
  }
  flush();

  return { intro, sections };
}
