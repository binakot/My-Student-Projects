using System;
using Microsoft.JScript;
using Microsoft.JScript.Vsa;
using System.Collections.Generic;

namespace DSPS2._0
{
    public class MathEvaluator : INeedEngine
    {
        private VsaEngine vsaEngine;

        public virtual String Evaluate(string expr)
        {
            var engine = (INeedEngine)this;
            var result = Eval.JScriptEvaluate(expr, engine.GetEngine());

            return Microsoft.JScript.Convert.ToString(result, true);
        }

        VsaEngine INeedEngine.GetEngine()
        {
            vsaEngine = vsaEngine ?? VsaEngine.CreateEngineWithType(this.GetType().TypeHandle);
            return vsaEngine;
        }

        void INeedEngine.SetEngine(VsaEngine engine)
        {
            vsaEngine = engine;
        }
    }

    public class SendForm
    {
        public List<string> vFuncs = new List<string>();
        public int i;
        public int j;
        public int k;
        public double R;
        public double C;
    }
}
