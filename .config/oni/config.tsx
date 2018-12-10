
import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")
    oni.input.bind(["<enter>", "<tab>"], "contextMenu.select");
    oni.input.bind("<f11>", "oni.editor.gotoDefinition")
    oni.input.bind("<f8>", "workspace.openFolder")
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    "editor.fontFamily": "FuraCode Nerd Font",
    "editor.linePadding": 8,
    "editor.fontLigatures": false,
    "editor.fontSize": "14px",
    "editor.renderer": "webgl"
    "experimental.session.enabled": true,
    "oni.loadInitVim": true,
    "ui.animations.enabled": true,
    "ui.colorscheme": "codedark",
    "ui.fontFamily": "FuraCode Nerd Font"
    "ui.fontSmoothing": "auto",
    "ui.fontSize": "13px"
    "oni.plugins.prettier": {
        "settings":{
            "arrowParens": "always",
            "printWidth": 100,
            "singleQuote": true,
            "tabWidth": 2,
            "trailingComma": "all"
        }
        "formatOnSave": true,
        "enabled": true
    }
}

module.exports = {
    activate,
    configuration
}