package TestFiles.cbaPetStoreTest;

import com.intuit.karate.junit5.Karate;

class UsersRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("cbaPetStoreTest").relativeTo(getClass());
    }

}
