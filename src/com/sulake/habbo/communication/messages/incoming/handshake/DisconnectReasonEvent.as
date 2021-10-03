package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1588:int = 5;
      
      public static const const_1578:int = 113;
      
      public static const const_1518:int = 29;
      
      public static const const_1723:int = 0;
      
      public static const const_1678:int = 102;
      
      public static const const_1618:int = 25;
      
      public static const const_1636:int = 20;
      
      public static const const_1640:int = 116;
      
      public static const const_1593:int = 114;
      
      public static const const_1577:int = 101;
      
      public static const const_1670:int = 108;
      
      public static const const_1599:int = 112;
      
      public static const const_1697:int = 100;
      
      public static const const_1624:int = 24;
      
      public static const const_1338:int = 10;
      
      public static const const_1531:int = 111;
      
      public static const const_1542:int = 23;
      
      public static const const_1685:int = 26;
      
      public static const const_1359:int = 2;
      
      public static const const_1642:int = 22;
      
      public static const const_1524:int = 17;
      
      public static const const_1672:int = 18;
      
      public static const const_1500:int = 3;
      
      public static const const_1597:int = 109;
      
      public static const const_1371:int = 1;
      
      public static const const_1561:int = 103;
      
      public static const const_1522:int = 11;
      
      public static const const_1654:int = 28;
      
      public static const const_1606:int = 104;
      
      public static const const_1666:int = 13;
      
      public static const const_1539:int = 107;
      
      public static const const_1540:int = 27;
      
      public static const const_1608:int = 118;
      
      public static const const_1622:int = 115;
      
      public static const const_1641:int = 16;
      
      public static const const_1594:int = 19;
      
      public static const const_1671:int = 4;
      
      public static const const_1635:int = 105;
      
      public static const const_1705:int = 117;
      
      public static const const_1573:int = 119;
      
      public static const const_1702:int = 106;
      
      public static const const_1530:int = 12;
      
      public static const const_1675:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(reason)
         {
            case const_1371:
            case const_1338:
               return "banned";
            case const_1359:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
