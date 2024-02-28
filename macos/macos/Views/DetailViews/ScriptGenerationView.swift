//
//  ScriptGenerationView.swift
//  macos
//
//  Created by 小林駿斗 on 2024/02/24.
//

import SwiftUI
import OpenAISwift

struct ScriptGenerationView: View {
    @EnvironmentObject var promptServer: PromptServer
    let apiKey: String = "APIキー"
    var config: OpenAISwift.Config!
    var openAIClient: OpenAISwift!
    
    init() {
        config = OpenAISwift.Config.makeDefaultOpenAI(apiKey: apiKey)
        openAIClient = OpenAISwift(config: config)
    }
    
    var body: some View {
        VStack
        {
            Text(promptServer.originalText + promptServer.promptText)
                .padding()
                .frame(width: .infinity, height: .infinity)
            Button(action: {
                //ここにAPIの処理
                print("Generation Start")
            }) {
                HStack {
                    Image(systemName: "waveform")
                    Text("生成")
                    
                }
            }
        }
        
        
    }
}

struct ScriptGenerationView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptGenerationView().environmentObject(PromptServer(originalText: "あいう", promptText: "これで文章作ってね"))
    }
}


