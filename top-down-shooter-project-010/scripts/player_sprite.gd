extends Sprite2D

func play_run_L():
	%AnimationPlayer.play("Run_L")

func play_run_R():
	%AnimationPlayer.play("Run_R")

func play_idle_L():
	%AnimationPlayer.play("Idle_L")

func play_idle_R():
	%AnimationPlayer.play("Idle_R")

func playHurt():
	%AnimationPlayer.play("hurt")
#var animationArr = [
		#[Callable(play_idle_L),Callable(play_idle_R)],
		#[Callable(play_run_L), Callable(play_run_R)]
	#]
#
#func playArr(x, y):
	#animationArr[x][y].call()
