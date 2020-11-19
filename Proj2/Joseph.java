import java.util.Scanner;

class player
{
    int ID;
    String name;
}

public class Joseph
{
    public static void main(String[] args)
    {
        Scanner in=new Scanner(System.in);
        System.out.println("请输入游戏人数：");
        int N=in.nextInt();
        System.out.println("请输入开始游戏的玩家编号：");
        int S=in.nextInt();
        System.out.println("请输入报数结束的数字：");
        int D=in.nextInt();
        int n=N;    //剩余人数
        player[] a=new player[N];
        for(int i=0;i<a.length;i++)
        {
            a[i]=new player();  //初始化，注意：没有此步程序运行会报空指针异常错误
            a[i].ID=i+1;
            a[i].name="player"+Integer.toString(i+1);
        }
        int key=(S+D-2)%n;

        System.out.println("被淘汰的玩家ID依次为：");

        for(int i=1;i<=N-1;i++)
        {
            System.out.print(a[key].ID+"\t");
            if(key<n-1)
            {
                for(int j=key;j<=n-2;j++)
                {
                    a[j]=a[j+1];    //数组元素前移覆盖
                }
            }
            n--;
            key=(key+D-1)%n;
        }
        System.out.println();
        System.out.printf("The winner's ID is %d, and his name is %s.",a[0].ID,a[0].name);
    }
}
