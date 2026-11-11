Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794361185;
	b=ocBx65tK0IO9xsYbGqOgsBzF3zMGjCbEebIMufHdZUPTeItkX8CmzEfZejVo6vxMtsbc
	 oGHVCUXT4/QB1S4xq6Z9iRuaMWeOtT+wnesefOkQm5mQhDZqS/Qp01tRb15R2G8x51Usy
	 aD4ywACedymmGwrenDV3IAz976WSFiL3wHaE1ZdhaOFKNOiHbjk21pEomLZFvlSZuZh2h
	 TzfNmtdGFFo4p6vOHFbGiQlOVEodtIvQbUf+kmNndM30XxKfRrwahwVyug1EHxOIGZ4bw
	 2Waa4u8FoxH8MPPN8t+AICzXabx7Fs66jsSkGhe4o38s95olZAzRZyfPCMwsste8UoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361185;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=3gITO0+EVe223uFWEZD3gxP9qHLanTXMyOHRyVef6LI=;
	b=YzhMuJ0yDbrQ58N8Vjo8QNYbg8Heb+Y4VSvII2LYWHrWKujeyqzK18WnOT6mOFgIhN4h
	 4BOR564FDAZ28D5VHYbkcraKvmNdTEjgx4RJLkDzNtSTKIinhTp8D/8FqTp/h6cXD572c
	 kSRRXNjwLzDnpCOfCYEAgeCj4buMTcbkDHVaFZ8J0gVacTMQQHKGAqN+y7MLA/klt8JwH
	 aK22ay+nUd1nNBLk1Sd9+CnO7TauyCobZlhk1WlSHZR+zG5zrlnTIgI4mzH4R77IMak1M
	 Q0zEGg1gcrlJtt9ayHBEtdM/Pgpvcg+ycEvMe1cjLXTIIix/Ohev3x5Hr1hKal5iSDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="vIMz/rLm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.29
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E58606A320
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 01:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E58606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vIMz/rLm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/7SGfJkGNhXoRdVFUvmahyrVy+QcmthMZ7SO7Qh22kKGa4RpzH5q27RbGwiUQxEO8dZ54jr4vIWWyOCtFS7qVyfOamlud5BDkn5xssJSs/kszv7OAMHGfPZ3aTGVMagsm/2MqVG3zfrpBGfbCqbi0kP84bPr8zH+nCWC9IO5GJo8D/ma5BoPVckxM37/V2XQdA2LFyXHJF3EhTyHi+K8AfABTaKSAgTo69mzA20w+2hq7eiZr862vq9H6NhcvV6EK0E8TA3Iv8E4DlyyPZGqFJyrCC1ke/+4u4gHm3Xx58tLhbi0Qwd5Tzv5QQi04h3uq1sGFanESSH4Tk/hmVs1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gITO0+EVe223uFWEZD3gxP9qHLanTXMyOHRyVef6LI=;
 b=Q8QEXy4c1jvRm/s8u4lPmfXch/8h2JH75KqyTOzjLjVbzaNFS8s/TtgaNFulIu/CywYeogg8zLZlrV8Hgz7FfnA9yU8rFmZ6HU2EMn04toE7Qgy+RYvug/qEJ1YBbCleViAkMDxlxmZSnMm0Izr39RnCY8A8P6Xb3RMsAuib53gDhNDjUKBXY33gp0SDnv6WimYCGmyfqk0rXL7wsJ4q3YfSRj0GZokK7eKt9+r71pGz5v49URjECstYnWYj5TxX7t2AwJ5edpcTCHsqOuVOl81d7vOZaDl/DlIPqKkzT9fEsT/1g3gDrx4eP13XeIbq6R70XG5zfUYdI2020G02GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gITO0+EVe223uFWEZD3gxP9qHLanTXMyOHRyVef6LI=;
 b=vIMz/rLms1SlZcqQZ3J1YVqAMK5vwExz9bQu3e3n7OHmH1AuhmXofgvIx0qDlTKxLchpRLiyjVdg1BmTRUDigj5si8e0VEsTU0uw7mcN2IRd8j0fndWMzxeAN16TTrBoDSW8ulDbBzzyGkD3C1e+pELriLKkABoNso4o0DzFa2tRqF+Dl4Q4b/CqnArwQzWwbPMQBOEVkzQRgYq8x0vP7B9evIYlyupbwJR+VHxStrIDAsDObBhQPAcNDYw9aW267gIlp1rom7TKeW0gr7U9ZkAicyXhnJc2+tswzt8sJh/ihWmINUIaaU1Xs4M0pKhZut+NLnnnFPfHnFkN+nGM0w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by AMBPR04MB454537.eurprd04.prod.outlook.com (2603:10a6:20b:7de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 01:39:41 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 01:39:41 +0000
From: jeff.chen_1@oss.nxp.com
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
Subject: pull-request: nxpwifi-next-20261106
Date: Wed, 11 Nov 2026 09:38:58 +0800
Message-Id: <20261111013858.98465-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:990:77::13) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|AMBPR04MB454537:EE_
X-MS-Office365-Filtering-Correlation-Id: b86124c7-3a49-4198-a4e3-08df3f94a7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|11063799006|56012099006|18002099003|6133799003|10067099003|261009223027099003|261026140227099003|261021123027099003|261022075727099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	BqtD3dHJVefQmh+qKsEgBR5neR6XHnqqGOt0clT9a6wzjQAqzx4DhM+VL5OZh7uM8UAEMxLcVgWvTMJyTdKoaHDRAzOYDF3luYhLBC0C0ZD8o+lRAgPDrIY67hK/0Mv6pEoK5muUatAfhJnK1gq2JnbiB0iw3VHMEIz/9iGSlFPbdr4MRBu368OxAovqQAaXr4pAZbMtZDOKwKwD1pmWA4VHTj7N+DC+q5UydLHci97L/ROleeJbolJq3lbRe2fMTSNawBF+AkDisjt59F0hbAKhSBxRvKcN7Em2kykCWc/JspF4Dbp1IB+6/bz/tFCm5h8qqAkIVbqGphzCI4PyBNOTTKbm+1StBVnvwdZmJxZjsNUb+Yo1RJyj09XDtW4yp5v07K/zo+bAr2qKamT5UbRwFNwzTfKo1PU5NVLGRNAQNj7x3cZzbtJ8nZZuvr7Pja2xVnET7EdAPF7OrYRp3l+ZMOO9Cmy85qKEbGr2ziYpUruKXN2D3i9O0OU+8jmFws74XyE5NunvkTybjdpfnyYkHufUS9lE/LrwL+SsOphwB0z2skHwjwrTZ9itjK6Bwxei7z7hrAhH/GMhKITyqvkX7ya9qRPRss77fzNt1fkckr7MgGlvresURctR5R/pe3czch7HYNZGjn49Pls8U+8KaC1YoGur39b/qh/t4LE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(18002099003)(6133799003)(10067099003)(261009223027099003)(261026140227099003)(261021123027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sqzSoUaf/Us9jvZvI3uAJHHyq+rMkBbKnW63AdCndL+0+usiQPUNSl8SjeHG?=
 =?us-ascii?Q?aOBqGtmhC8YF85Ocd1Kq+SFTNVMs5H7G9oCMq27t1vYiBxA50x0ZTum0XwMO?=
 =?us-ascii?Q?hdlV6QEmN4B5iegrNtCUa3im5UCrXo42AYDxX9XIMt5SpDi4BtLGVU62uFIy?=
 =?us-ascii?Q?aq2OnkzR0TOeGYuW4Y7pb8dTZPP5JPEPXpuh+fhkaK7v5qAUNJIU2mPvhajn?=
 =?us-ascii?Q?MUMcQhG9gCbK2OCXKs8v6QE3xgDkp55MMSeQxFleyuK4G6x0zio07Tv29xcZ?=
 =?us-ascii?Q?JBXpu8ZkvbjGrWAubJylycq3ouID6aDW3rpw/dnFiOL10SGMZQQwebRZYaax?=
 =?us-ascii?Q?KOOlzikIVXwrTRLLTn273pBAKg1wUzPCHa/Mc5e+nnoSsBTFG75bbeQwtwNj?=
 =?us-ascii?Q?S8uk8vhISOGN7NskpiwOl17mzmdWHGMJ2MgSmOCeMsTmFNMuRQWNSJtQpYCc?=
 =?us-ascii?Q?KiKX9GUK+R5C8psZ3AbzNX8OeDMOJybq7d6hiBo8Ht0aHlOVIfdjxHrBz6QF?=
 =?us-ascii?Q?XBYC/dEI9m7ugx639NjgzQrfWvG6X86hHFaZAQaVil2EJ8gh3HOlrqZsMgl0?=
 =?us-ascii?Q?nI42mO61C14KwclQij6xpXnpzENprVodCFBx04Z53iXJd+pFG3+LDMJtGKVe?=
 =?us-ascii?Q?t6XrBM5KDwlDHQ01ZcpiGBr7j6h/JAcVl2XJJocBpfNMyw2ZVr4eNgW5sk/z?=
 =?us-ascii?Q?Fqcj0d2ZCpJMAMYUqTgkDVLz60WvJ/66yuNCamF7XCDIZJTIjzw6kUjtm+ac?=
 =?us-ascii?Q?3E6xQuOr01kpiZSGGILo07L9vJNyajVutlrKy+WCPguMQgc462X7B5Ownlh5?=
 =?us-ascii?Q?LHTXFgMBMmyoqr28S6UnOOjjL1eFfIbjvTigClf6fZoC7TuZaqlx4bCuxyZO?=
 =?us-ascii?Q?Ps4qiMMI90ov5mK8ugvf76adfOEue0JELQNaj4DVNJsD4Jd7je8aKb0Cg1OO?=
 =?us-ascii?Q?9qTxEWRMh1RAX+SsWHE9IRvAhf/LtxDHgKnCcpdSqQtMD/TBlQdgInFoGTXg?=
 =?us-ascii?Q?xjWY2Br5d3DdpxMgnMca8ggfnTKVoSUSXUc5lG1/lESNuO9t8ChiL6XJ+xKc?=
 =?us-ascii?Q?C5WpAfsKTjPbRfxejDXNW4Y24P5LC+s0Qb+LQ767waIHVaO6ikDz71o+kTjY?=
 =?us-ascii?Q?Usz3Q7WbZEhbv2VzW+WskMXmhwS8BPd7qCeDM60qnAzr2A3CS4xgGJzQQDjW?=
 =?us-ascii?Q?j4eJDZa3jfBoj2xW3wCtxDxAP86x+O9kdzfsOY4BeZ2kYdmtxJUB59GMj61G?=
 =?us-ascii?Q?5yz+Qrzc66WAPDmaAz60ERx5P0thHD/5kCqbjfKpC2TgqN2HS95pylybIZaX?=
 =?us-ascii?Q?+la7pR7KzvRr7O/ep4iCRC2ZB3Jhi3SXYbcDCOS0/lgQid53RWIM556mnrLh?=
 =?us-ascii?Q?lJPB5F+aqSZBgMwCPY9/Gep+Q7hXrbhnkxZmFK2lG/qGsJ8S/0gXmWzxpyVL?=
 =?us-ascii?Q?YY0qNidYmIvh24wWs6A2CtYAkHt1RAfeX0t83pBtaMmIdtqiKMZOAxq4ZzQk?=
 =?us-ascii?Q?2W2yKHaYwZ1thS4O/OgfDn8G4A6ZXDM67MxogYPKzeAO2yZu3qVUpXc8+cy3?=
 =?us-ascii?Q?sq6yZiyKzuRmzOfQ6FhKZG4UY0M/9JbFb3xsTTz4KQLTifE/HAbRjRTRkLAn?=
 =?us-ascii?Q?pYAPCtrVR4SOwCedusxjLLt19vp8VaR+yNp8KDlSoBWp6Jody/TqV9JrFfOB?=
 =?us-ascii?Q?l/DjCjeDzw1ruwKQf9BH1gwTbARwEyIYzwTUz3x7yyrH8WUN7+e0mRu0KoNf?=
 =?us-ascii?Q?POjZ3YRx8UTazOgj4ujvRoseUxuSnX6tsltRWyyUUvOIXEKaj1pW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86124c7-3a49-4198-a4e3-08df3f94a7de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 01:39:41.4968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh/g/GWwXZz9fXVQqa61SVxDmiNFXKSIwvx5XmIVQIbh2DyzzFAeRtzRJcvtV4JfWTMyND2QgSlvmTZ8e/5JcsyuWZTDP7NqjpuC8nFOYhYNJeTxXQiIuXYBtwXTDBww
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB454537

Hi Johannes,

Please pull the following nxpwifi updates for Linux v7.5.
This series adds P2P support for nxpwifi.
Resending the pull request.

Thanks,
Jeff


The following changes since commit b8e5b0ae8ff47240366d38e5d12c65f878724316:

  wifi: mac80211: preserve disabled subchannel bitmap in 6 GHz CSA validation (2026-11-04 23:49:15 +0100)

are available in the Git repository at:

  https://github.com/nxp-upstream/nxpwifi-next.git tags/nxpwifi-next-2026-11-06

for you to fetch changes up to 99df6d2bd9943550c87b7ac7d3bb65019afbc70a:

  wifi: nxpwifi: enable P2P interface creation and role switching (2026-11-05 16:04:15 +0800)

----------------------------------------------------------------
----------------------------------------------------------------
nxpwifi patches for Linux v7.5 (PR #1)
- Add P2P mode configuration support
- Add P2P interface combinations and frame handling
- Enable P2P interface creation and role switching

----------------------------------------------------------------

----------------------------------------------------------------
Jeff Chen (3):
      wifi: nxpwifi: add P2P mode configuration command
      wifi: nxpwifi: add P2P interface combinations and frame handling
      wifi: nxpwifi: enable P2P interface creation and role switching

 drivers/net/wireless/nxp/nxpwifi/11n.c           |   3 +-
 drivers/net/wireless/nxp/nxpwifi/11n_rxreorder.c |   6 +-
 drivers/net/wireless/nxp/nxpwifi/cfg.h           |   3 +
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c      | 294 ++++++++++++++++++++++-
 drivers/net/wireless/nxp/nxpwifi/cfp.c           |   3 +-
 drivers/net/wireless/nxp/nxpwifi/cmdevt.c        |  11 +
 drivers/net/wireless/nxp/nxpwifi/cmdevt.h        |   1 +
 drivers/net/wireless/nxp/nxpwifi/fw.h            |  16 ++
 drivers/net/wireless/nxp/nxpwifi/init.c          |   1 +
 drivers/net/wireless/nxp/nxpwifi/join.c          |   1 +
 drivers/net/wireless/nxp/nxpwifi/main.c          |   5 +-
 drivers/net/wireless/nxp/nxpwifi/main.h          |   2 +-
 drivers/net/wireless/nxp/nxpwifi/sta_cmd.c       |  22 ++
 drivers/net/wireless/nxp/nxpwifi/sta_event.c     |   3 +-
 14 files changed, 363 insertions(+), 8 deletions(-)
