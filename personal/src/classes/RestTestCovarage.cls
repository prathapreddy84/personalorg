@RestResource(urlmapping='/TestCovarage/*')
global class RestTestCovarage
{
    @HttpPost
    global static void test1()
    {
        system.debug('>>>');
    }
}