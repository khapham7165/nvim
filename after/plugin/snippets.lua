local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local f = ls.function_node
local d = ls.dynamic_node

local function capitalize(str)
  return str:gsub("^%l", string.upper)
end

-- JavaScript-specific snippets
local js_snippets = {
  -- React Functional Component
  s("rfc", fmt([[
    export const {} = ({}) => {{
      return (
        {}
      );
    }};
  ]], {
    i(1, "Component"),
    i(2, "props"),
    i(3, "<div></div>"),
  })),

  -- useState Hook
  s("useS", fmt([[
    const [{}, set{}] = useState({});
  ]], {
    i(1, "state"),
    i(1, "State"),
    i(2, "initialValue"),
  })),

  -- useEffect Hook
  s("useE", fmt([[
    useEffect(() => {{
      {}
    }}, [{}]);
  ]], {
    i(1, "// effect"),
    i(2, "// dependencies"),
  })),

  -- useCallback Hook
  s("useC", fmt([[
    const {} = useCallback(({}) => {{
      {}
    }}, [{}]);
  ]], {
    i(1, "callback"),
    i(2, "params"),
    i(3, "// callback body"),
    i(4, "// dependencies"),
  })),

  -- useMemo Hook
  s("useM", fmt([[
    useMemo(() => {{
      {}
    }}, []);
  ]], {
    i(1, "// compute value"),
  })),

  -- useRef Hook
  s("useR", fmt([[
    useRef({});
  ]], {
    i(1, "null"),
  })),

  -- Event Handler
  s("eh", fmt([[
    const handle{} = (e) => {{
      {}
    }};
  ]], {
    i(1, "Event"),
    i(2, "// handler logic"),
  })),

  -- Map Array
  s("map", fmt([[
    map((item) => (
      {}
    ));
  ]], {
    i(1, "// jsx"),
  })),

  -- Conditional Rendering
  s("if", fmt([[
    {{{} ? (
      {}
    ) : (
      {}
    )}}
  ]], {
    i(1, "condition"),
    i(2, "// true"),
    i(3, "// false"),
  })),

  -- Import React
  s("imr", fmt([[
    import React from 'react';
  ]], {})),

}

-- TypeScript-specific snippets
local ts_snippets = {
  -- React Functional Component
  s("rfc", fmt([[
    type {}Props = {{
      {}
    }}

    export const {}: React.FC<{}Props> = ({}) => {{
      return (
        {}
      );
    }};
  ]], {
    i(1, "Component"),
    i(2, "// props"),
    i(1, "Component"),
    i(1, "Component"),
    i(3, "props"),
    i(4, "<div></div>"),
  })),

  -- useState Hook with type
  s("useS", {
    t("const ["),
    i(1, "state"),
    f(function(args)
      local name = args[1][1]
      return ", set" .. capitalize(name)
    end, { 1 }),
    t("] = useState"),
    t("<"),
    i(2, "Type"),
    t(">("),
    i(3, "initialValue"),
    t(")")
  }),

  -- useEffect Hook
  s("useE", fmt([[
    useEffect(() => {{
      {}
    }}, []);
  ]], {
    i(1, "// effect"),
  })),

  -- useCallback Hook with types
  s("useC", fmt([[
    useCallback({}) => {{
      {}
    }}, [])
  ]], {
    i(1, "params"),
    i(2, "body"),
  })),

  -- useMemo Hook with type
  s("useM", fmt([[
    useMemo(() => {{
      {}
    }}, [])
  ]], {
    i(1, "// value"),
  })),

  -- useRef Hook with type
  s("useR", fmt([[
    useRef<{}>({})
  ]], {
    i(1, "type"),
    i(2, "null"),
  })),

  -- Event Handler with TypeScript event types
  s("eh", fmt([[
    const handle{} = (event: {}) => {{
      {}
    }}
  ]], {
    i(1, "Event"),
    i(2, "React.MouseEvent<HTMLElement>"),
    i(3, "// handler logic"),
  })),

  -- Map Array with types
  s("map", fmt([[
    {}.map((item) => {{
      {}
    }})
  ]], {
    i(1, "array"),
    i(2, "logic"),
  })),

  -- Conditional Rendering
  s("ifr", fmt([[
   {{{} ? (
      {}
    ) : (
      {}
    )}}
  ]], {
    i(1, "condition"),
    i(2, "true"),
    i(3, "false"),
  })),

  s("useLazyQuery", fmt([[
    const [{}, {{ data, loading }}] = useLazyQuery<{}>({}, {{
      client: {},
      variables: {},
    }})
  ]], {
    i(1, "queryName"),
    i(2, "ResponseType"),
    i(3, "QUERY"),
    i(4, "clientName"),
    i(5, "variables"),
  })),
  s("useLazyMutate", fmt([[
    const [{}, {{ data, loading }}] = useLazyMutate<{}>({}, {{
      client: {},
      variables: {},
    }})
  ]], {
    i(1, "queryName"),
    i(2, "ResponseType"),
    i(3, "MUTATE"),
    i(4, "clientName"),
    i(5, "variables"),
  }))
}

local base_snippets = {
  s("clo", fmt([[
        console.log('{} :>> ', {})
    ]], {
    i(1, "variable"),
    f(function(args)
      return args[1][1] -- Return the value from the first insert node
    end, { 1 })
  })),
  s("clg", fmt([[
        console.log('{} :>> ')
    ]], {
    i(1, "variable"),
  })),
  -- switch case
  s("switch", fmt([[
    switch ({}) {{
      case {}:
        {}
        break;
      default:
        break;
    }}
  ]], {
    i(1, "expression"),
    i(2, "first"),
    i(3, "// logic"),
  })),

  -- try catch
  s("try", fmt([[
    try {{
      {}
    }} catch (error) {{
      console.error('error :>> ', error)
    }}
  ]], {
    i(1, "logic"),
  })),

  -- for loop
  s("for", fmt([[
    for (let i = 0; i < {}.length; i++) {{
      {}
    }}
  ]], {
    i(1, "[]"),
    i(2, "body"),
  })),
}
-- Add JavaScript snippets
ls.add_snippets("javascript", js_snippets)
ls.add_snippets("javascriptreact", js_snippets)
ls.add_snippets("javascript", base_snippets)
ls.add_snippets("javascriptreact", base_snippets)

-- Add TypeScript snippets
ls.add_snippets("typescript", ts_snippets)
ls.add_snippets("typescriptreact", ts_snippets)
ls.add_snippets("typescript", base_snippets)
ls.add_snippets("typescriptreact", base_snippets)
