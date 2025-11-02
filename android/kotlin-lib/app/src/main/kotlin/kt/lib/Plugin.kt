package kt.lib

class Plugin {
    var app: App? = null
        private set
    fun createApp(): App {
        app = App()
        return app!!
    }

    external fun sum(nums: List<Int>): Int

    external fun setResult(result: Int)
}