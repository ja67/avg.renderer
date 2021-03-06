import * as avg from "avg-engine/engine";
import { ScriptingDispatcher } from "app/common/manager/scripting-dispatcher";
import { Impl } from "app/common/api/impl";
import { APIDialogueChoice } from "avg-engine/engine";

export class APIDialogueChoicesImpl extends Impl {
  @Impl.registerImpl(APIDialogueChoice, avg.OP.ShowChioce)
  public static async op_show(scriptUnit: avg.AVGScriptUnit): Promise<avg.SelectedDialogueChoice> {
    const script = <avg.APIDialogueChoice>scriptUnit;

    return await new Promise<avg.SelectedDialogueChoice>((resolve, reject) => {
      ScriptingDispatcher.dispatch(avg.OP.ShowChioce, script, resolve);
    });
  }
}
