import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";

export function Prose({ content }: { content: string }) {
  return (
    <div className="max-w-3xl font-display text-[0.84375rem] leading-[1.6] text-text-secondary">
      <ReactMarkdown
        remarkPlugins={[remarkGfm]}
        components={{
          h2: (props) => (
            <h2
              className="mt-10 font-display text-[1.1875rem] font-bold leading-[1.25] text-text-primary first:mt-0"
              {...props}
            />
          ),
          h3: (props) => (
            <h3 className="mt-8 font-display text-base font-bold text-text-primary" {...props} />
          ),
          p: (props) => <p className="mt-4 first:mt-0" {...props} />,
          ul: (props) => <ul className="mt-4 list-disc space-y-2 pl-5" {...props} />,
          li: (props) => <li {...props} />,
          strong: (props) => <strong className="font-semibold text-text-primary" {...props} />,
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
