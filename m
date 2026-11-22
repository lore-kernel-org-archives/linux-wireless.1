Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795332162;
	b=OdJLfYUxAVumiIhMZEKxUpJFFg/gNyi1chiVogBgW0OWNoUFO/mKWfgf+EOQmpdINQZu
	 WvL653ALRTw9rPs6heyVK+UxAOYIewA6bd/DOduV7E/8ma7HKOn5rzkm7U4BOxDqTsAKH
	 /kjXQVUIeaHTvyvT9RhGLACXCaQAm/O5veTk104rbIDa/FXFQwbWyTkzlnCYksQVmRe3i
	 tXTsx2fysP4S/v0eM/PFHfCH/vL2e0HnLRIXeOzsHUNfco1O3NB0agUz5IjBTnTbttT8x
	 eKVQGiSAqWTnUs59q/jIiqxdgHPoZoLDmcd6yzx9Vh9NqibvQCC84cxnv+EVnlcjJIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332162;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=h5X3QP82Tn3qD4/No/c/3R9K02zsWTZPDNQlYzhaTqo=;
	b=FNonP2sK1I400a38tyjLsQtQy10rM8xd3mZh6bakhIv1EJtnkZpJEdmt6UqHKS+xGXk3
	 BZ6CdiXp41KLVp1KGcS779OuwUZ5s55sL81YixMBcl9kK00/hHNTpBl0MXex6cfCgZom3
	 2idbDp2ISE5KO5rglwwxfRsduQJesETqKcy8mnJEht/od0JuTOJ5kZl1nj3/EMmyOOOlO
	 9/7d9BeLZHyhqQyVU7aPy0o3cqgjE7/c1yPl1D8OrDY9j7aIqap6Nt4cMN0psm+lZmwMX
	 8YwLBakOAKP9SpnKNVEydujCU3IjWpbUviY2scJv9isvqS2H+Es+iP76F+PvdbKU2bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=D7jVRH2Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.65
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3167D606A32A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 07:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3167D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=D7jVRH2Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0h4EA2r+BOL3QbYIQu4/8nStuVJTbuG0Dm0SERiKNkDiEzk1lkYKI862KPv93oSNHbqRoTdG78HCmqYGuvZEgsNeA7F9eMDAp6cs5sAaFu7IGB3RZVPRbYnj8YIGOjhIWYfzIwWM7YvB/pBrbCwlpKUy0rXSufjmUT0E5wBV32us+HX3hN9RQVX638cSV2rBKySm3TCEOUTRW7Rct1KG9PvGWE6R9Vp8H5mvYalo9+f8+EoQw2ujmh0yQsLZLrqxnDkK52WTQ74EGu82EdyFZGdfZZCRewmSB4uj3Es2TvpXpehgHHWmc7MTqE7Bm1YvjNFWxdDRX06VDx4FlzqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5X3QP82Tn3qD4/No/c/3R9K02zsWTZPDNQlYzhaTqo=;
 b=uqfDgVEQHUE5Yx8aHm8ec6zj1QUKih5/wCwWTsUwZ1bj+DHlJS6i5iKq+QC3NoOkWxCz056DTYRsi39jD4sSlMW0fbRvETuAtLIEDwwCipJhR812aqk4dGL6zpKdNZ0zgW5I0kU4Fsv5stm1e0szPuhisUk/F/q4mC0pQFzfZmVF6N/DSKNoLebKKOeyDC8anh0Yz9TX06XMwAZMWQN5yBMaeeKqOblw09JMyCuMEzyR50YhCMPb3wcPekJw8lIPTt6h2tmDLfzkcBH61t6EPrOcOsX+JCq5qIZXGuTf3qoJmYTYe1mPnTIYUPwjWLBojw95d0F3mqD8D6s11uQ2bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5X3QP82Tn3qD4/No/c/3R9K02zsWTZPDNQlYzhaTqo=;
 b=D7jVRH2Q9xKSJLQAfRLz+g6XicE0y+O3tZ/B0LY4azrUfbQLnmYIsAQ9VYPWzqwl4mL0qU2nx4Z+h9Jf9tHUODZPVqXHrhtqaXHeY12yXIYE05c2ISB67IgZzguqexlwJUcaZa22w4IwpI7VJNDLFkhnEzgtZRLkxx5ksQY0xORwLmYMsYc8Ksu8MBDZA98PbuBHCG8U5h6Wde9n47qpNMgCFRaKekXVd1PZeCWapKVzxYjopnne0xlky/2c3nrGPOVV/TaZgIHmL9N84/Kqx3vaG2HZx/7qGVKfLODmQEEilalRW+jEtLTiYgI0FWwBVpemaGXwyKsGg6Qa5/IpHg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 07:22:38 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 07:22:38 +0000
From: jeff.chen_1@oss.nxp.com
To: Tristan Madani <tristmd@gmail.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH v2 wireless 0/2] wifi: nxpwifi: firmware response validation fixes
Date: Sun, 22 Nov 2026 15:21:38 +0800
Message-Id: <20261122072139.712789-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120225933.1148680-1-tristan@talencesecurity.com>
References: <20261120225933.1148680-1-tristan@talencesecurity.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::11) To VE1PR04MB7280.eurprd04.prod.outlook.com
 (2603:10a6:800:1af::22)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e33e8b0-48d0-4360-4620-08df486962a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|261102123227099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261026121527099003|261026140227099003|11063799006|56012099006|10067099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	vc9x7+oBRY0ZIADKdY8Iy48Gn+MH/fMKpRQPSbzQ+VAFr73nrKsHk9CmhtycQM1YiSrNztvXL8R5gPjyAhHE4n+D/M3lGEE6liusLVRNZY3AtRqi6pc6IQcxmxW87pr/URbSGh7XOQ3OvV7gYMTP8i1zR0XQfqT2gggAKaYa9KP7gw8U7CYkO4xCohLJHOfx+Rk/FrckBeFGSzeCZMizi8X9Ae6ea25+9J36QKgIlGPJOmIgLAlmoWwey1JW/ZlMlECA7a1j7rdcRcxOA4PgM6P6pY0xpnUHZVEbburxmZtIUOtGwbidKv2bXl3syHaeukUlQBVxaFiyVfcefxDwp2638Ah6E5+WYKyv0JW6aIxOsXLrwKNSUiKO5meZKBN7/eaEjXbNniRLL2HjAdXlIumNpkCEMPby0aQW8yjcgGEDS2sdGE2X7C7zE638BuwoaZ+246A5+aCVrnIiQH7m4AgC3tlZAWN5WLt5AKPp2bIBH8hhL81odbzOxyHTDU88W73RxoAhiZJW0iEsty8iqDruEq0siGGc9HNyrLv8Zhvh0lBo3KBP5Yv8ipdey77HwI25jsrqUfQYwgLW3UCSHVxAIviyz4ObXhZIu1EHQl4BObTiz0AoJgeG2VtHRAbz8AUfZeBK3oN15o7CGTenYqg+H6ldoYlSa06rQvtZldE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261026121527099003)(261026140227099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HArPWoS0t5ubtgIOv8O2AxrVHDZrQ4CUi17tx/fG41EEuliMeVDs4E+VGvJf?=
 =?us-ascii?Q?3XiU6dqBmr3e1WZnSAAR95TlsuuJTtvQ3KC7jpqEObLIPL0JAA2i4IAeGXfl?=
 =?us-ascii?Q?cGUox/lEQo2zQlqOzqnK/XAmXGdBK3gxpjPOs72/v3PCBAjKuFd4oRZ56rP1?=
 =?us-ascii?Q?qAhC5fuWSOh5+wqJOjnNza0iHVbE4LSc4w45tOSICZ3BKmZNJljXoSzM0pOO?=
 =?us-ascii?Q?7t1a/m17wSroiFzK9mGKVS7Ow1vZvLT8JDbf/CKg+FOL0+yij5DTyWo32iY9?=
 =?us-ascii?Q?Zo3p9HZXKAKGYFBs2AulZH/XiKGfTkKoqojftVqYgQQCTnMrm0L3xYjsBThj?=
 =?us-ascii?Q?Q/VIEbeAvak+wYATxHdmncJz1n+d2yMGv4x5/ov+tp2F5qWM3WFozy2SvJfg?=
 =?us-ascii?Q?JmVHuITvcVxNuXjk4MCuXt5Sh9GmlFfE6YBhGdc4dnuP1OhiKXmKTuIjOM1S?=
 =?us-ascii?Q?rWaNaDXtT0JHSwqNz9yAAcfDhBT1T3/MWLec08iod5TDADcA4fllAhaba6aV?=
 =?us-ascii?Q?/zFlYZ2AucWkn26hvQ3D3ux224+dh7uxRB5okk6QXmIy72ACveZahxzYiZe5?=
 =?us-ascii?Q?IjkrBtPOBjzeYgn44o4qZXeHH7egqZoh0Au5H75B1I+17JOBfEnhJPVaYwrM?=
 =?us-ascii?Q?pJtRS8Tr0BiSuLCkssKdMcsH54NUZv/AQyPujltl+Jbozrvn2eUCkZHKS8FJ?=
 =?us-ascii?Q?Z6P9yyWh7Kb/Oz84yvOCuXDlDNGF1bhzVFoGM/EggQdIKpBZj2dYC2lZZZkM?=
 =?us-ascii?Q?tqzsRetQPLFmeZrFu3WGDsfLYyxaBhGESZ8H3N+98yTRyTfrS7TlBBBzgrL6?=
 =?us-ascii?Q?qoereqx1OBLSi7totYgzTu18Xwzuvsttx6XCr76Rr3HHSiuGGdQ/gamunwu8?=
 =?us-ascii?Q?GzxDc5zkNw1shQ9GN2xn6c6tYIH9wG4qS1FsMAg0J9eyrzDIDz4iBj5Ky/do?=
 =?us-ascii?Q?ZSRBR4RTlYBWUQFb+/2MY1wdNcJRtRaVv28hL7bfg4fQxcaKBx9x/VatJx8m?=
 =?us-ascii?Q?ra8b6YcYmrvHd/B42Fh8MIq1T7lvbzuZBKJiE0SJu83PyNrMQQ5V95iL/7Ij?=
 =?us-ascii?Q?ka3gnSP5QhDC2Sh7vNpEZrv7lg6UJtYdoF585PKLj4ENlZqyBLe/d0mpSlRF?=
 =?us-ascii?Q?ZTXMEw92TNATHQGnDJ8ZmPFGzOUrFZ5lO0IFuH91wq5OIQRiaM2eyacDkS2w?=
 =?us-ascii?Q?iWENpnNtDAiQMdcXbj63F2UPvBAHEhn+0QzDEsiKBIDsOjpJPVZp3gbjPOxB?=
 =?us-ascii?Q?OVG7mfmacWcPV8h1iF3sNpgvqQQ9SKtY+s2fmpK0b9c8y7c/vqDGYekG4EMW?=
 =?us-ascii?Q?kO1ELo9MQTWTGFTSlCM19C+2BaNUfg7k72k6YGr9n0S4OYSE5Bgq4y5x+9YN?=
 =?us-ascii?Q?/ltND8S6CJD/WgCqpFDRl1J2IuU7PybEpJBixXExHSnzX6gTxt1ALBPrIg8s?=
 =?us-ascii?Q?AhBertdTxVQMIvt7Jipod/+fGNk7TUGadlHXSxoMfvmDlpVS60iUbH3f+GCs?=
 =?us-ascii?Q?8Ny4olcRFPMzdJSdKFDlokTg2ptxxbzoJ8pWD8VMOkKg+grDxgUBa930LEbR?=
 =?us-ascii?Q?WKNn/fxlbGxcsE/0s+4NadZpsmMHqCkREQpY6n0EcdfswdWJggsR4TxZs2yB?=
 =?us-ascii?Q?mhTPb/h9hDSwSLvHMTb0u5dpP47ENaODRbhjBCFfOU3OVCfD+0LiCZo8EN1X?=
 =?us-ascii?Q?aNl7xlH9v+6u9E/pcqSagMB5A0nZc7c99YwFqweSPoLXIHCicuAfawVQTBqS?=
 =?us-ascii?Q?bM2uUEPR9RBCgRNTgsmscVT/w86bcXSYai+UY1JgNwmCt0WM+UMf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e33e8b0-48d0-4360-4620-08df486962a4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 07:22:38.3107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLyl34IPbtw69sWiosNdyxikRANQy1R/3OE0pxAASerLnrxV0TBPfz1xxodABJp18osxITbkOh0Id3xYJjvSE1s6Q5vAXBH0Un1zNwLZO7ocDoNaA6KKqZk4kwccOiyJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Fri, Nov 20, 2026 at 10:59:31 PM +0000, Tristan Madani wrote:
> The nxpwifi driver trusts several size fields from firmware responses
> without validating them against actual buffer lengths. This series
> adds bounds checks to prevent reads past the buffer when firmware
> provides inflated sizes.
> 
> Changes in v2:
> - Dropped the HE capability TLV length patch (was 1/3), superseded by
>   commit f17e2eda1630a ("wifi: nxpwifi: bound the TLV lengths in the
>   11AX_CFG response")
> - Patch 2/2: moved the response size check after timer_delete_sync()
>   so the command timer is properly cancelled before the early return,
>   as pointed out by Jeff Chen
> 
> Tristan Madani (2):
>   wifi: nxpwifi: validate ext_scan buf_size against event buffer length
>   wifi: nxpwifi: validate command response size against buffer length
> 
>  drivers/net/wireless/nxp/nxpwifi/cmdevt.c | 14 ++++++++++++++
>  drivers/net/wireless/nxp/nxpwifi/scan.c   |  9 +++++++++
>  2 files changed, 23 insertions(+)
> 

Hi Tristan,

Thanks for the v2. I will take it this time.

For future patches, please note:

- checkpatch warns that your From: (tristmd@gmail.com) does not match
  your Signed-off-by (tristan@talencesecurity.com). Please make them
  match.
- cc_maintainers: some maintainers were not Cc'd. Please use
  scripts/get_maintainer.pl to build the Cc list.

Thanks,
Jeff

