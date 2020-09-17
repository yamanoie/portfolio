& ps aux

psコマンド・・・プロセスの動作状況を確認するためのコマンド

auxオプション
a = 端末操作のプロセスを表示
u = CPUやメモリの使用率などを表示
x = 端末操作以外のプロセスを表示



*コマンドを打つと以下のようになる


USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.2  19696  2588 ?        Ss   Sep14   0:01 /sbin/init
root         2  0.0  0.0      0     0 ?        S    Sep14   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        I    Sep14   0:00 [kworker/0:0]
root         4  0.0  0.0      0     0 ?        I<   Sep14   0:00 [kworker/0:0H]
root         5  0.0  0.0      0     0 ?        I    Sep14   0:00 [kworker/u30:0]
root         6  0.0  0.0      0     0 ?        I<   Sep14   0:00 [mm_percpu_wq]
root         7  0.0  0.0      0     0 ?        S    Sep14   0:00 [ksoftirqd/0]
root         8  0.0  0.0      0     0 ?        I    Sep14   0:00 [rcu_sched]
root         9  0.0  0.0      0     0 ?        I    Sep14   0:00 [rcu_bh]
root        10  0.0  0.0      0     0 ?        S    Sep14   0:00 [migration/0]
root        11  0.0  0.0      0     0 ?        S    Sep14   0:00 [watchdog/0]
root        12  0.0  0.0      0     0 ?        S    Sep14   0:00 [cpuhp/0]
root        14  0.0  0.0      0     0 ?        S    Sep14   0:00 [kdevtmpfs]


*各項目の意味

USER
PID = プロセスID
&CPU = プロセスのCPU使用率
&MEM = プロセスが確保している物理メモリ
VSZ = 仮想メモリの全サイズ
RSS = 使用中の物理メモリー量
TTY = 制御端末の種類および番号
STAT = プロセスのステータス
	・R = 実行可能な状態のプロセス
	・S = 割り込み可能な待ち状態
	・D = ディスクIO待ちの状態(disk Input/Output, 外部記憶装置に対する読み（インプット）、書き(アウトプット)
	・T = 停止またはトレース中
	・W = スワップ・アウトしたプロセス(スワップアウト：メモリ上のデータを一時的にハードディスクへ退避させること)
	・Z = ゾンビ・プロセス
	・s = 複数プロセスが起動している場合のセッションリーダー
	・l = マルチスレッドのプロセスでセッションリーダー
	・< = 優先度が高いプロセス
	・+ = フォアグラウンドのプロセスグループ
START
TIME = プロセスが開始した時刻
COMMAND = プロセスのコマンド名