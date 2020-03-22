// test_project01.cpp : このファイルには 'main' 関数が含まれています。プログラム実行の開始と終了がそこで行われます。
//

#include <vector>
#include <functional>
#include <iostream>

using namespace std;

int main()
{
    std::vector<std::function<void(void)>> commandlist;

    commandlist.push_back([]() {cout << "GPU Set RTV-1" << endl; });
    cout << "CPU Set Op-2" << endl;

    commandlist.push_back([]() {cout << "GPU Clear RTV-3" << endl; });
    cout << "CPU Clear Op-4" << endl;

    commandlist.push_back([]() {cout << "GPU Close-5" << endl; });
    cout << "CPU Close Op-6" << endl;

    cout << endl;

    for (auto& cmd : commandlist) {
        cmd();
    }

    getchar();

    return 0;
}

// プログラムの実行: Ctrl + F5 または [デバッグ] > [デバッグなしで開始] メニュー
// プログラムのデバッグ: F5 または [デバッグ] > [デバッグの開始] メニュー

// 作業を開始するためのヒント: 
//    1. ソリューション エクスプローラー ウィンドウを使用してファイルを追加/管理します 
//   2. チーム エクスプローラー ウィンドウを使用してソース管理に接続します
//   3. 出力ウィンドウを使用して、ビルド出力とその他のメッセージを表示します
//   4. エラー一覧ウィンドウを使用してエラーを表示します
//   5. [プロジェクト] > [新しい項目の追加] と移動して新しいコード ファイルを作成するか、[プロジェクト] > [既存の項目の追加] と移動して既存のコード ファイルをプロジェクトに追加します
//   6. 後ほどこのプロジェクトを再び開く場合、[ファイル] > [開く] > [プロジェクト] と移動して .sln ファイルを選択します
