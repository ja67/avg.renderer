
character.show("demo/domo-ask.png", {
  position: "(left,10%)",
  renderer: {
    filter: [
      {
        name: "opacity",
        value: 90
      }
    ]
  }
});

character.show("demo/kingwl-normal.png", {
  position: "(70%,5%)",
  renderer: {
    filter: [
      {
        name: "opacity",
        value: 90
      }
    ]
  }
});

let mainChar = "";
let secondChar = "";

const vizee = "[c=red][rt=战备通信专家]木村长[/rt][/c]";
const space = "[c=red][rt=黑客]空格[/rt][/c]";
const latyas = "[c=red][rt=死肥宅]拉提亚斯[/rt][/c]";

const resetCamera = () => {
  camera.to(
    0,
    {
      scale: 1
    },
    500
  );
};

const focusToVizee = () => {
  camera.to(1, {
    x: -100,
    scale: 1.2,
    skewX: -1
  });

  camera.to(2, {
    x: -200,
    y: 0,
    scale: 1.2,
    skewX: -1
  });
};

const focusToSpace = () => {
  camera.to(1, {
    x: 100,
    scale: 1.2,
    skewX: 1
  });

  camera.to(2, {
    x: 210,
    y: 10,
    scale: 1.2,
    skewX: 1
  });
};

const char_vizee = function(slot, suffix) {
  return {
    name: vizee,
    character: {
      slot: slot,
      avatar: {
        file: `demo/vizee-${suffix}.png`,
        renderer: {
          offset_x: 0,
          offset_y: -130,
          filter: []
        }
      }
    }
  };
};

const char_space = function(slot, suffix) {
  return {
    name: space,
    character: {
      slot: slot,
      avatar: {
        file: `demo/space-${suffix}.png`,
        renderer: {
          offset_x: 0,
          offset_y: -160,
          filter: []
        }
      }
    }
  };
};

// api.startSkip();

api.showText(["「唔……」", "「咦……？[wait]这里是……？」"]);
api.hideText();
api.transitionTo("white", 1, 100);
// api.loadScene(0, "demo/demo-tree.png");
const handle = scene.load(0, "demo/room-2.jpg");

api.transitionTo("white", 0, 100);
api.updateSetting("TextSpeed", 100);
api.showText(["「呜哇哇哇哇哇哇！！！！[wait]发生了什么？！」"]);
api.updateSetting("TextSpeed", 80);
api.hideText();
api.wait(1000);
api.showText(["「诶！？[wait=200]这是哪里？我是谁？我为什么突然出现在这个地方？」"], {
  name: "不知名少女"
});
api.hideText();
api.wait(1000);

api.showText(["「哈哈哈哈哈哈哈哈」"], {
  name: "奇怪的笑声"
});
api.hideText();
api.wait(500);
api.showText(["「……？」"], {
  name: "不知名少女"
});
api.hideText();
api.wait(500);
api.showText(["「哈哈哈哈哈哈」"], {
  name: "奇怪的笑声"
});
api.hideText();
api.wait(500);
api.showText(["……", "（……这魔性的笑声怕不是个傻子吧）"], {
  name: "不知名少女"
});
api.hideText();
api.wait(500);

api.playBGM("demo/demo_theme.mp3");
api.wait(1500);

api.showText(["「我，才不是什么傻子！」"], {
  name: "奇怪的人"
});

api.showText(["「诶！？你是谁啊，这是哪里，你怎么知道我在想什么！」"], {
  name: "不知名少女"
});

api.showText(["[s=26][c=red]爆裂吧现实！粉碎吧精神！放逐这个世界！[/c][/s]"], {
  name: "奇怪的人"
});

api.showText(["（……？？？）", "（这是哪来的中二病）", "（不好，我要赶紧弄懂自己为什么在这里。）"], {
  name: "不知名少女"
});
api.hideText();

api.wait(500);

api.showText(["「咳咳。」", "「女人，告诉我，你的名字。我会告诉你这是哪里。」"], {
  name: "奇怪的人"
});

api.showText(
  [
    "（这个人好像能知道我在想什么）",
    "（……太可怕了啊导演。）",
    "（万一，说不定他真的知道呢？为了赶紧离开这里，还是告诉他好了。）"
  ],
  {
    name: "不知名少女"
  }
);

let isOK = false;

while (!isOK) {
  let choice = api.showChoices(["风见", "（手动输入）"]);
  if (choice.selectedIndex === 1) {
    let inputResult = api.showInputBox("我叫什么名字？", {
      inputType: 0,
      minLength: 1,
      maxLength: 5,
      allowCancel: true
    });
    isOK = inputResult.isOK;
    if (!isOK) {
      api.showText(["「唔，还是告诉他名字吧……」"], {
        name: "不知名少女"
      });
    } else {
      api.setVariable("your_name", inputResult.value);
      mainChar = inputResult.value;
    }
  } else {
    isOK = true;
    api.setVariable("your_name", choice.selectedText);
    mainChar = choice.selectedText;
  }
}

api.showText(["「[c=yellow]${your_name}[/c]。」"], {
  name: "${your_name}"
});

api.hideText();
api.wait(500);

if (mainChar.match(/([A-Za-z0-9_])\w+/g)) {
  api.showText(["「[c=yellow]${your_name}[/c] 是什么破名字，乱打的吧？」"], {
    name: "奇怪的人"
  });
} else {
  api.showText(["「唔唔唔，[c=yellow]${your_name}[/c]，听上去真是个好名字。」"], {
    name: "奇怪的人"
  });
}

api.showText(["「女人，你成功引起了我的注意。」"], {
  name: "奇怪的人"
});

api.showText(["（……这是哪抄来的霸道总裁桥段）"], {
  name: "${your_name}"
});

api.setVariable("AngryPowman", "安格瑞·鲍尔曼");

api.showText(
  ["「这是一个虚拟的世界，它的创作者就是我。我是创世神——[c=red][rt=Angry Powman]${AngryPowman}[/rt][/c]。」"],
  {
    name: "${AngryPowman}"
  }
);

api.showText(["（真难听的名字！）"], {
  name: "${your_name}"
});

api.showText(["「女人，我知道你在想什么，你这是在玩火！」"], {
  name: "${AngryPowman}"
});

api.showText(["「喂，你把我带到这个奇怪的地方想干什么！」"], {
  name: "${your_name}"
});

api.showText(["「难道你没发现这个世界有什么问题吗？」"], {
  name: "${AngryPowman}"
});

api.showText(["(这个世界唯一的问题就是你吧……）"], {
  name: "${your_name}"
});

api.showText(["「这个世界，由 [c=red]脚本[/c] 组成，你所看到的所有元素，都是可以执行的代码单元。」"], {
  name: "${AngryPowman}"
});

api.showText(["「……明白了，但是我要反抗，离开这里！」"], {
  name: "${your_name}"
});

api.showText(
  ["「在某种情况下，你可能带有随机元素，但是你自以为可以反抗的自我意识，其实也被安排的明明白白。懂我意思吧？」"],
  {
    name: "${AngryPowman}"
  }
);

api.showText(["「不懂……所以我什么时候可以回去。」"], {
  name: "${your_name}"
});

api.showText(["「那么除了我们，这个世界不存在其他人了吗？」"], {
  name: "${your_name}"
});

api.showText(["「当然是存在的。看我——」", "「[c=red]禁术 · 大传送术！[/c]」"], {
  name: "${AngryPowman}"
});

api.hideText();
api.wait(300);

api.playSE("demo/clap.mp3");
api.loadScene(0, "");
api.wait(400);
api.playSE("demo/clap.mp3");
api.loadScene(0, "demo/cave.jpg");

api.wait(600);
api.playBGM("demo/demo_theme_2.mp3");
api.wait(600);

api.showText(["「！！！」", "「这是什么鬼地方！」"], {
  name: "${your_name}"
});

api.showText(["「我已经用失传很久的禁术把你传送到这里了。」", "「想学啊？我教你啊。」"], {
  name: "${AngryPowman}"
});

api.showText(["（不就是换了个场景么……不对我为什么会知道这个。）", "「没没没，我一点都不想学。」"], {
  name: "${your_name}"
});

api.showText(["「还从来没有人会这么无视我，很好，你成功的勾起了我的兴趣，女人。」"], {
  name: "${AngryPowman}"
});

api.showText(["「请你让开！像你这么有钱长的又帅的男人我是不会喜欢的。」"], {
  name: "${your_name}"
});

api.hideText();
api.wait(300);

api.showText(["「？？？」", "「等等，我为什么会说出这种话。混蛋，凑不要脸！」"], {
  name: "${your_name}"
});

api.showText(["「你跟外面那些妖艳的贱货完全不一样，有点意思。」"], {
  name: "${AngryPowman}"
});

api.showText(["（你到底是有多不会写剧本啊，就算不会也别抄霸道总裁啊！！）"], {
  name: "${your_name}"
});

api.showText(["「是不是很厉害。」"], {
  name: "${AngryPowman}"
});

api.showText(["（一点都不！）"], {
  name: "${your_name}"
});

api.showText(["「啊！对了，差点忘记去木村的」"], {
  name: "${AngryPowman}"
});

api.hideText();
// api.wait(600);

// api.transitionTo("black", 0, 0);
// api.transitionTo("black", 1, 1000);

// api.wait(600);

api.loadScene(0, "demo/room.png", {
  transition: "brush",
  duration: 1000
});

api.transitionTo("black", 0, 1000);

resetCamera();
api.showText(["「嗨，木村先生，我来看望您了。」"], {
  name: "${AngryPowman}"
});

api.showText(["「咳咳……」"]);

focusToVizee();
api.showText(
  ["「请称呼我的全名——[c=yellow]木村长[/c]。」", "「另外，据说有人原本打算今天要发一个很厉害的科幻短篇故事来着？」"],
  char_vizee(2, "normal")
);

// api.hideCharacter(1);

resetCamera();
api.showText(["「嘿嘿嘿，其实这个是有原因的。这不是画师跳票了嘛。看在只有你有立绘的份上……不提这事儿。」"], {
  name: "${AngryPowman}"
});

focusToVizee();
api.showText(["「哦？可是我听说你是因为沉迷游戏才导致跳票的。」"], char_vizee(2, "smile"));

// api.hideCharacter(1);

resetCamera();
api.showText(["「没……没有这回事，游戏制作人的事，能叫跳票吗？」"], {
  name: "${AngryPowman}"
});

focusToVizee();
api.showText(["「我认为得你在逃避跳票的责任。」", "「后面打算做一款什么样的游戏？」"], char_vizee(2, "smile"));
// api.hideCharacter(1);

resetCamera();
api.showText(["「你也看到了，这都跳票了，我怎么知道是什么游戏。」"], {
  name: "${AngryPowman}"
});

focusToVizee();
api.showText(["「没有事先计划吗？」"], char_vizee(2, "normal"));

resetCamera();
api.showText(["「有是有的，可这[rt=AVGPlus]引擎[/rt]部分完工都太久了。做一款正式正式的游戏太难了。」"], {
  name: "${AngryPowman}"
});

focusToSpace();
api.showText(["「你们……在说什么？」"], char_space(4, "normal"));
// api.hideCharacter(1);

resetCamera();
api.showText(
  ["「诶？！」", "「如果问没猜错的话……」", "「这位就是你们研究所里那位神秘而且神龙见首不见尾、从不露脸的大黑客吗？」"],
  {
    name: "${AngryPowman}"
  }
);

focusToSpace();
api.showText(["「……」", "「被你说的，一点都不神秘了。」"], char_space(4, "normal"));

api.wait(800);

focusToSpace();
api.showText(["「等我一会儿。」"], char_space(4, "normal"));
api.hideText();
api.hideCharacter();
character.hide();
api.wait(700);

// api.stopSkip();

focusToSpace();
api.showText(["「蒙面术——」", "「启动！」"], char_space(4, "normal"));
api.hideCharacter();
api.wait(300);

api.transitionTo("white", 1, 200);
api.transitionTo("white", 0, 200);

api.wait(10);

focusToSpace();
api.showText(["「怎么样，现在不知道我是谁了吧？」"], char_space(4, "hidden"));

focusToVizee();
api.showText(["「……」"], char_vizee(2, "normal"));
api.showText(["「……」"], {
  name: "${AngryPowman}"
});

resetCamera();
api.showText(["（这种中二病，真的会是被联邦通缉的大黑客吗？）"], {
  name: "${AngryPowman}"
});

focusToSpace();
api.showText(["「真的是。」"], char_space(4, "hidden"));

resetCamera();
api.showText(["「？！」", "「为什么你知道我在想什么？！」"], {
  name: "${AngryPowman}"
});

focusToSpace();
api.showText(
  ["「听说这是你开发的世界？」", "「刚刚带上面罩的瞬间，root 权限已经是我的了。」"],
  char_space(4, "hidden")
);

resetCamera();
api.showText(["「……！」"], {
  name: "${AngryPowman}"
});

resetCamera();
api.showText(["「……大哥喝茶！」"], {
  name: "${AngryPowman}"
});

text.hide();

api.wait(1000);

widget.image("demo/camera_bloodstain.png", {
  // size: "(500%, 500%)",
  position: "center",
  // scale: 4,
  renderer: {
    filter: [
      {
        name: "opacity",
        value: 30
      }
    ]
  }
});
focusToSpace();
api.showText(["「对了……木村」", "「听说阿斯特防线的战况不太好？」"], char_space(4, "hidden"));

api.showText(
  ["「……」", "「情况非常不好，兽化人开始了大规模暴动，似乎是统一接到了某种[c=blue]命令[/c]，对人类发动了袭击。」"],
  char_vizee(2, "angry")
);

focusToVizee();

focusToSpace();
api.showText(["「对了……木村」", "「听说阿斯特防线的战况不太好？」"], char_space(4, "hidden"));

api.wait(300);

api.transitionTo("black", 1, 2000);
