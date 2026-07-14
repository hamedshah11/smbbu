import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import type { Element as HastElement } from "hast";

/**
 * Shared across the Prose instances of a single page so only the first
 * qualifying list renders as the numbered feature grid.
 */
export type FeatureListState = { used: boolean };

function listItemCount(node: HastElement | undefined): number {
  if (!node) return 0;
  return node.children.filter((c) => c.type === "element" && c.tagName === "li").length;
}

export function Prose({
  content,
  featureListState,
}: {
  content: string;
  featureListState?: FeatureListState;
}) {
  return (
    <div className="max-w-3xl font-display text-[0.84375rem] leading-[1.6] text-text-secondary">
      <ReactMarkdown
        remarkPlugins={[remarkGfm]}
        components={{
          h2: ({ children, ...props }) => (
            <h2
              className="mt-10 font-display text-[1.1875rem] font-bold leading-[1.25] text-text-primary first:mt-0"
              {...props}
            >
              <span aria-hidden="true" className="mb-3 block h-[2px] w-6 bg-green-primary" />
              {children}
            </h2>
          ),
          h3: (props) => (
            <h3 className="mt-8 font-display text-base font-bold text-text-primary" {...props} />
          ),
          p: (props) => <p className="mt-4 first:mt-0" {...props} />,
          ul: ({ node, ...props }) => {
            if (featureListState && !featureListState.used && listItemCount(node) >= 3) {
              featureListState.used = true;
              return (
                <ul
                  className="feature-grid mt-6 grid grid-cols-1 gap-x-10 pl-0 sm:grid-cols-2"
                  {...props}
                />
              );
            }
            return <ul className="mt-4 list-disc space-y-2 pl-5" {...props} />;
          },
          li: (props) => <li {...props} />,
          strong: (props) => <strong className="font-semibold text-text-primary" {...props} />,
          blockquote: (props) => (
            <blockquote
              className="mt-6 border-l-2 border-gold-accent pl-5 font-serif text-[1.25rem] font-medium leading-[1.45] text-text-primary"
              {...props}
            />
          ),
          table: (props) => (
            <div className="mt-4 overflow-x-auto">
              <table className="w-full border-collapse text-left" {...props} />
            </div>
          ),
          thead: (props) => <thead className="border-b border-hairline-strong" {...props} />,
          th: (props) => (
            <th
              className="whitespace-nowrap px-3 py-2 font-mono text-[0.625rem] font-medium uppercase tracking-[0.05em] text-text-faint"
              {...props}
            />
          ),
          td: (props) => (
            <td className="border-b border-hairline px-3 py-2 font-display text-sm" {...props} />
          ),
          a: (props) => <a className="text-green-primary hover:text-hairline-strong" {...props} />,
        }}
      >
        {content}
      </ReactMarkdown>
    </div>
  );
}
