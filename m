Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795511514;
	b=MN3d48G/ae5KyaRW7GhpwXeueaqS0fJWc6u3lWMA6R+dOVjGUeGxlTPLEl0I87YqP4Va
	 huCdsf+cGK2zJlM4RZJ4CLm/j2+Quvw2WKMs/ymi0lctTEHy28GmwlLrCoYWB48j+7dz7
	 OhQhpdW+NnCKeXpHV5wXao8w1WLm2YPkMuosBML98HRGZib3x+ZshS7ON3uQjHHKZmGnK
	 bkH45Qsy6SKvceElliyycsCZqGzAg1hv6rR/btk8vDZg8FeENnIAD9McSTp9Zq8fwgkVC
	 w7rl0Q2fYqlMGpxLk+Opgg3eagawTyb8HK8CUS/9vc6L9anmaDYwIvDCnIlJbnNqXsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511514;
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
	bh=78buejIkGPjlYq75+RaidqhS3J5zmDKXfsQGjafTg/8=;
	b=wBjqgrJ5thg+wx7sPNseJcpkiMNC84/giYRdwsdVqxy/YSCuScRij5KG+0okNXX8Xdsw
	 HN4CxNMEjW1BFuKptDMYgR7SQEflckC9Ibq2y9S40ruiWYJyMPgnDcLZ5jkkQAGuK9/Gk
	 6Y2ZEjo2DB2uaiWUXMnLt4kWGvhWpaZV9t8p27ciInOwWSFJdOJpPRPj4212i9bbXEyiH
	 axAUqjnHlwkCXnU2BMFPzvub6mWiicYbnnVpVibyAsYM6n8ThCFZh1DY/nalD84iZO4ow
	 AmTdzmBGa3dml487mvAK0+FtPAd8DksYDsv44frOAXV5JJ31YQUts2TV0KFl6g5ySuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=n71JSXix;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.61
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB0F606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB0F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=n71JSXix
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpI/pImXer5/woo91daUZHbPu/bugFmZMUrzT306lz7L0l0h6rIl4Yzn8UkpHdnntnAs2DdOlpWrQFhDEJ/MBS3mbMCH9JaD0NWgstWgL1AB6zgOtt2H9FUj292suXQL1kGZGT7lVeYsgciImrBJ6aJYoJAwr+j39x81Mz8zvfxN5Zjy01a+twcY6zTol7rcY8TFMeMFbpxWhcqGU31H9cD6a6g3M/kIhYU5GllzG80vWRpq52Pk/7xHJGy/0+Uievc0Ke4ufdmUG0Kmez7WnJSo7Km4lA0YPWizVxYTRYqKR8cemao1z8wz86/4nevCLU5kYkmChrvHfzExROPk/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78buejIkGPjlYq75+RaidqhS3J5zmDKXfsQGjafTg/8=;
 b=f43miFBcnP86POuzeQQtD/WLB/oOmTF9Cvhm+g29iKlIU6ZS7HIGqv8453h8XIWq11SX1b2F7c8FtxJWAEI+zUqdC3X3ZIIpNqdducY3ieASD8FWmwMnpdZt1C8mqYamjhGUIhESvTvVHwCsxQCWXjR2lta+2yEkgdOnlkXpwUxZXwRhodO+Ds1apq9ZpA9U9X4aDcEdVYHDmeNdsAbQ8m/Yo/qsXPPEHpGh93AedxsDGCwU/z9rodFn9YEvStwCur2OfpKAOkdD8vsYkrkM7Ij2MolGi1Vp9oAFr9oDle7SbtX+RPB99hClUeJzOHelLMut9aWfv8Sw34i2BXFMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78buejIkGPjlYq75+RaidqhS3J5zmDKXfsQGjafTg/8=;
 b=n71JSXix+crOwW30/b9XlF4nkkOGvHNKL2hwrLLzO539Dxi7iAY1QbQU5Bt+dePZf4g/JsM2AdyKwxjAgqilmPTQ4xowwZX6oZYrkBrUIE6HdpEDHPwsmfxZGUBiMFWhXv27WR3wBDu8kWR76TRueLJsCQMc0RTwutvXf+BX69sOsY1NgucczGY3SViNzGEis+yY7UC+78UJTiv2e2X/yVabW2OpJR09O5Dcfi6B+esdQWFN0KUtQvbT4LRlZYfsGrotSS6I+5J93FeP24QbwC07tXZ48ICriP3/ISaBr3W4MX5yI2uA8orSacMcn+X8pofkdZm/D710esZnJvq0OQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by FRRPR04MB12620.eurprd04.prod.outlook.com (2603:10a6:d10:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 09:11:49 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 09:11:49 +0000
From: jeff.chen_1@oss.nxp.com
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	francesco@dolcini.it,
	Jeff Chen <jeff.chen_1@nxp.com>
Subject: [PATCH RESEND,wireless-next 3/3] wifi: nxpwifi: add netlink vendor command for TX power limits
Date: Tue, 24 Nov 2026 17:10:28 +0800
Message-Id: <20261124091028.807981-4-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124091028.807981-1-jeff.chen_1@oss.nxp.com>
References: <20261124091028.807981-1-jeff.chen_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|FRRPR04MB12620:EE_
X-MS-Office365-Filtering-Correlation-Id: 560d502b-4394-48fc-6e7c-08df4a0af8ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006|261026135527099003|261102123227099003|261022113327099003|261026130827099003|261009223027099003|261021133027099003|261022115727099003|261021130227099003|261021121427099003|261021135927099003|261022105027099003|261026121527099003|261022075727099003|261021123027099003|261026140227099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	r0SarzfnOwoClUaH4D1GZEkZGJvGTHHlDXjAvWFOlPB6D4TNADsW89SFHe/KjtNXwrqS3cUPkp/DY4mzU3ai6HuGHvG1KSIG9kbRbHRq9m89Vfr8Am2IpMLbKxHIFTeJysw5AL8BnA8iO4MepNImtong02h99bEJ8hk9eEgA3j9tq+q2uh1QSrF41p8GEiUBkmGOgNtBgh2upPPnXcYdJc8ynYx0ta3dWdP2apf4RUBnKMfNxrJc4sqqbve6aL8iL46Deeuj2DLr5D0yxUsfB584ld0RRdjcdXQGofP4unG6/7nC+SYQEi+DC5XXldUMMVmbhtKJOdxBteSeWz3M5Hr5KXAwUp3/KMFVbR9K0hIW5uIlIA/P2pMVTEuTYAQdtbB6/goeeWJy7c+IopcUQz7rCel24rd2fBpo5/Y5eZ5ol0jijY2EWWPakqDQ/8yP1jskOuI9YgAUagvsUwcV9onsDTDPPnWfATNDgzYoi2ZZDFIjsVNMnWC1ttQ5ZwWNdVCMJyZj0RwA6IWe1MqPQn1SG/2OWBAvxqrGe/0sPVs3LHlFg8sxMGsz94PdPoHwbrjItjinbtPFN+7QcglDpCU01d8nK7KUzj9ZiU7NnEk3ywJddZ6wE8SUfgYWYTNIEilAQ5+sWE6YJlgwIkNAv2cBqdbk1qPvgSL16ukek1U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(261026135527099003)(261102123227099003)(261022113327099003)(261026130827099003)(261009223027099003)(261021133027099003)(261022115727099003)(261021130227099003)(261021121427099003)(261021135927099003)(261022105027099003)(261026121527099003)(261022075727099003)(261021123027099003)(261026140227099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CtxT8CHDKiz85WS2FGrMPHvlhw60oNHJUnVVoE+kI5jahHtKRowuUFD+5qcr?=
 =?us-ascii?Q?tKaRKL2UjkWHr/BZD604P+2pryZg+bb9gtEAI3pRvrBJfX9FSHFAnKau+Cdg?=
 =?us-ascii?Q?HsTr6iG+I+BWZ9AYrOoCtwG5eplo9DTeKzukGELfPR2LB2H7CvT5kBadeXYe?=
 =?us-ascii?Q?SmkjJj4awOA1dhIGXd468uOq9tf2ALMVIrLYL2ShSGMqA/UKBtmNFf6uFbwd?=
 =?us-ascii?Q?saKlCEeWgA4i9aL159zhiqgDsTYsV9/MsmyqGJ89kQa9UG4OqYx5Zwe23Iug?=
 =?us-ascii?Q?jCPnRMX1UUrK5tefmMozMUXQHjt7TFxGGoWw5Q23A/6SXQFJWzsQpKOC3CKY?=
 =?us-ascii?Q?Wh6M/GmrB8djHhnfBeUuf0KixOcXZW7VBlYZuAqn7cqAQhvq1JT11QwVH6TA?=
 =?us-ascii?Q?Oo1QNcjjCuxNMUfQ8MLPWqXV6YNucmtR898LR7u0N1scXbIzIZ0rHQpmUS6t?=
 =?us-ascii?Q?IYKbFBrYj51fBvy8gcXUJGOVBNgFbnyR+oEyjGlcWmnyooxZxZcxWN/rsmQx?=
 =?us-ascii?Q?7FXog1cNsOkeeTXO6yRkHMmXglKPK9Oc4Dkjwx6Bn9RXGkIeWFQfayBu6x2l?=
 =?us-ascii?Q?2EDCE86YjqYkByhDH8+Dd4YtSYlqKlz0jjbti8wjCBZ7Q3f+0loQnEcHcXZZ?=
 =?us-ascii?Q?Do97dSbwoV0kpKMfPmp3VYstWW6YS9bq6LWlsMr/qx0QvOvsCOC1zu5hnPBA?=
 =?us-ascii?Q?0onoE7wSNeEtpqpEl1IPUa3n9lI0vH1UJc8IPKHsxKZYqalaCRlMViWPEY8f?=
 =?us-ascii?Q?Vbd5jY04paHpXvcw3RSQ4fy8nNxMO9PiZWQZSdTCgN8MplnxHDObD8bDv4/0?=
 =?us-ascii?Q?pV8xaWScvrs9LpykqirE+VenjJDxIEgGJaRZqrEnU6PnB8/M5m+sCIgob+aZ?=
 =?us-ascii?Q?vmNqsFZN3/Vq+i3Glvp54WU3u+6zvXldNUyqx9afS6dx7lcULgR2DK1F81H/?=
 =?us-ascii?Q?SpnR4wcg7D7zFZIqF3S0KZpf1b6869dd8H4yRWtJsVIslcNFlj69f1t/MaiF?=
 =?us-ascii?Q?dfxCEAXLCurHnsK+POKSCBxA3Knzbjz36OohpLGrIDgOKhcAMSjgedOLr+S3?=
 =?us-ascii?Q?2fzqR2uD7wwihGZDq54xU+lBvqqJ4GPph3paABfmlvxClOvBtOTwxsJHv/7b?=
 =?us-ascii?Q?z7yLbQqeaVn0bSxuxiDP3OA6MyaShw0LGpsyMba5Z/umdf1VJkpKRXtoYKw5?=
 =?us-ascii?Q?yEWe14QSdS7hCawSoU8cQO4mK9dRPKRfZyAFbIUVqRj9qiVw+4mQdVblF/EI?=
 =?us-ascii?Q?+QJY7QvlVghFwSCi2Szh25GSXooEuytq4/0Z5tXyX+aXym3swDh1W/FO3iy5?=
 =?us-ascii?Q?ANIgWMXACR36fx1MC4IdCZDuEEuvdxl5L/xyndPaFYLKIgFIjCgCnpvsu64i?=
 =?us-ascii?Q?Qf2CNHzt1IUdTUFlWStweqRyAKhwRRHHxyAspe8llcaU2PO4arC5QfJmpsYU?=
 =?us-ascii?Q?jblogDfRHq0KwgVj1fnFZ4wNCmB0EwjLdDDOXURRWRAcqJrvNc5d37LajRAX?=
 =?us-ascii?Q?hPzvup7+NM1H+P3QyPOQXItSEnF9WiP00xrUTepfI7QEHZ4yxf+bEfHzBO95?=
 =?us-ascii?Q?Aw9pxQoN9zGYAJdgWf6uXIqGUhVto2PZNNQPIrEA5qWYX6dxxwqmya9kpgqJ?=
 =?us-ascii?Q?LJEZyXr4V6zbgD9G49qi7FfPfH+AntkZjZRHIKSli7EuPgVq6PYoxlMXfonE?=
 =?us-ascii?Q?gYtj588E/vgl312Vo4j2WJ0rveimPQr3H1GPl8p5rnilGG6p9UGN8cn9M8P1?=
 =?us-ascii?Q?/yYR8I2AHzWhtll3MTndEuNnVhkfugxo/TqzBQxwR5Hn7kh7NvGK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560d502b-4394-48fc-6e7c-08df4a0af8ea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 09:11:49.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6EgcTNfy4XL8qxcj/9oRmJqLt4aAKEwkOKxCU/R2dcj6g2AbbV9QCFx3CRA4J/gjs39CR1uhc8QGu4rDdmheNnCipJGvkaXMsdZXu0fwXG3PWfYt8X5Le1d95mJM60k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12620

From: Jeff Chen <jeff.chen_1@nxp.com>

Add support for the NXP TX power limit vendor command.

The command provides userspace access to firmware Transmit Rate-based
Power Control (TRPC) configuration through NL80211_CMD_VENDOR.

Signed-off-by: Jeff Chen <jeff.chen_1@nxp.com>
---
 drivers/net/wireless/nxp/nxpwifi/Makefile   |   1 +
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c |   5 +-
 drivers/net/wireless/nxp/nxpwifi/main.h     |   1 +
 drivers/net/wireless/nxp/nxpwifi/vendor.c   | 152 ++++++++++++++++++++
 drivers/net/wireless/nxp/nxpwifi/vendor.h   |  14 ++
 5 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/wireless/nxp/nxpwifi/vendor.c
 create mode 100644 drivers/net/wireless/nxp/nxpwifi/vendor.h

diff --git a/drivers/net/wireless/nxp/nxpwifi/Makefile b/drivers/net/wireless/nxp/nxpwifi/Makefile
index 8f581429f28d..f82435253a72 100644
--- a/drivers/net/wireless/nxp/nxpwifi/Makefile
+++ b/drivers/net/wireless/nxp/nxpwifi/Makefile
@@ -28,6 +28,7 @@ nxpwifi-y += sta_tx.o
 nxpwifi-y += sta_rx.o
 nxpwifi-y += uap_txrx.o
 nxpwifi-y += cfg80211.o
+nxpwifi-y += vendor.o
 nxpwifi-y += ethtool.o
 nxpwifi-y += 11h.o
 nxpwifi-$(CONFIG_DEBUG_FS) += debugfs.o
diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index ba54078b082c..b7bd10bb0a91 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -10,6 +10,7 @@
 #include "cmdevt.h"
 #include "11n.h"
 #include "wmm.h"
+#include "vendor.h"
 
 static const struct ieee80211_iface_limit nxpwifi_ap_sta_limits[] = {
 	{
@@ -91,7 +92,7 @@ u8 nxpwifi_get_chan_type(struct nxpwifi_private *priv)
 }
 
 /* Retrieve the driver private data from the wiphy */
-static void *nxpwifi_cfg80211_get_adapter(struct wiphy *wiphy)
+void *nxpwifi_cfg80211_get_adapter(struct wiphy *wiphy)
 {
 	return (void *)(*(unsigned long *)wiphy_priv(wiphy));
 }
@@ -3848,6 +3849,8 @@ int nxpwifi_register_cfg80211(struct nxpwifi_adapter *adapter)
 	wiphy->cipher_suites = nxpwifi_cipher_suites;
 	wiphy->n_cipher_suites = ARRAY_SIZE(nxpwifi_cipher_suites);
 
+	nxpwifi_set_vendor_commands(wiphy);
+
 	if (adapter->regd) {
 		wiphy->regulatory_flags |= REGULATORY_CUSTOM_REG |
 					   REGULATORY_DISABLE_BEACON_HINTS |
diff --git a/drivers/net/wireless/nxp/nxpwifi/main.h b/drivers/net/wireless/nxp/nxpwifi/main.h
index 9ae017bdc6ca..bbfc4266c48d 100644
--- a/drivers/net/wireless/nxp/nxpwifi/main.h
+++ b/drivers/net/wireless/nxp/nxpwifi/main.h
@@ -1435,4 +1435,5 @@ void nxpwifi_dev_debugfs_remove(struct nxpwifi_private *priv);
 int nxpwifi_reinit_sw(struct nxpwifi_adapter *adapter);
 void nxpwifi_shutdown_sw(struct nxpwifi_adapter *adapter);
 bool nxpwifi_is_valid_region_code(enum nxpwifi_region_code code);
+void *nxpwifi_cfg80211_get_adapter(struct wiphy *wiphy);
 #endif /* !_NXPWIFI_MAIN_H_ */
diff --git a/drivers/net/wireless/nxp/nxpwifi/vendor.c b/drivers/net/wireless/nxp/nxpwifi/vendor.c
new file mode 100644
index 000000000000..3f1834cf8844
--- /dev/null
+++ b/drivers/net/wireless/nxp/nxpwifi/vendor.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * NXP Wireless LAN device driver: vendor command interface
+ *
+ * Copyright 2026 NXP
+ */
+
+#include <net/mac80211.h>
+#include <net/netlink.h>
+#include "vendor.h"
+#include "main.h"
+
+/* Attributes for NXP_VENDOR_CMD_TXPOWER_LIMIT. */
+static const struct nla_policy
+nxpwifi_txpwrlimit_policy[NXP_ATTR_TXPWRLIMIT_MAX + 1] = {
+	[NXP_ATTR_TXPWRLIMIT_ACTION] =
+		NLA_POLICY_MAX(NLA_U8, NXP_TXPWRLIMIT_ACTION_SET),
+	[NXP_ATTR_TXPWRLIMIT_SUBBAND] = { .type = NLA_U8 },
+	[NXP_ATTR_TXPWRLIMIT_DATA] = { .type = NLA_BINARY,
+				       .len  = NXPWIFI_MAX_TRPC_BUF },
+};
+
+static bool nxpwifi_txpwrlimit_subband_valid(u8 subband)
+{
+	switch (subband) {
+	case NXP_TXPWRLIMIT_SUBBAND_2G:
+	case NXP_TXPWRLIMIT_SUBBAND_5G_0:
+	case NXP_TXPWRLIMIT_SUBBAND_5G_1:
+	case NXP_TXPWRLIMIT_SUBBAND_5G_2:
+	case NXP_TXPWRLIMIT_SUBBAND_5G_3:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int nxpwifi_vendor_txpower_limit(struct wiphy *wiphy,
+					struct wireless_dev *wdev,
+					const void *data, int data_len)
+{
+	struct nxpwifi_adapter *adapter = nxpwifi_cfg80211_get_adapter(wiphy);
+	struct nlattr *tb[NXP_ATTR_TXPWRLIMIT_MAX + 1];
+	struct nxpwifi_ds_chan_trpc_cfg *ch_trpc;
+	struct nxpwifi_private *priv;
+	struct sk_buff *resp;
+	u8 action, subband = 0;
+	u16 tlv_len = 0;
+	int ret;
+
+	ret = nla_parse(tb, NXP_ATTR_TXPWRLIMIT_MAX, data, data_len,
+			nxpwifi_txpwrlimit_policy, NULL);
+	if (ret)
+		return ret;
+
+	if (!tb[NXP_ATTR_TXPWRLIMIT_ACTION])
+		return -EINVAL;
+	action = nla_get_u8(tb[NXP_ATTR_TXPWRLIMIT_ACTION]);
+
+	if (tb[NXP_ATTR_TXPWRLIMIT_SUBBAND]) {
+		subband = nla_get_u8(tb[NXP_ATTR_TXPWRLIMIT_SUBBAND]);
+		if (!nxpwifi_txpwrlimit_subband_valid(subband))
+			return -EINVAL;
+	} else if (action == NXP_TXPWRLIMIT_ACTION_GET) {
+		/* A subband selector is required for GET operations. */
+		return -EINVAL;
+	}
+
+	if (action == NXP_TXPWRLIMIT_ACTION_SET) {
+		if (!tb[NXP_ATTR_TXPWRLIMIT_DATA])
+			return -EINVAL;
+		tlv_len = nla_len(tb[NXP_ATTR_TXPWRLIMIT_DATA]);
+	}
+
+	priv = nxpwifi_get_priv(adapter, NXPWIFI_BSS_ROLE_STA);
+	if (!priv)
+		return -ENODEV;
+
+	/* Reserve space for the returned TRPC table on GET requests. */
+	ch_trpc = kzalloc_flex(*ch_trpc, tlvbuffer,
+			       (action == NXP_TXPWRLIMIT_ACTION_SET) ?
+			       tlv_len : NXPWIFI_MAX_TRPC_BUF, GFP_KERNEL);
+	if (!ch_trpc)
+		return -ENOMEM;
+
+	ch_trpc->action = (action == NXP_TXPWRLIMIT_ACTION_SET) ?
+			  HOST_ACT_GEN_SET : HOST_ACT_GEN_GET;
+	ch_trpc->subband = subband;
+
+	if (tlv_len)
+		memcpy(ch_trpc->tlvbuffer,
+		       nla_data(tb[NXP_ATTR_TXPWRLIMIT_DATA]), tlv_len);
+
+	ch_trpc->len = sizeof(ch_trpc->action) + sizeof(ch_trpc->subband) +
+		       tlv_len;
+
+	ret = nxpwifi_chan_trpc_cfg(priv, NXPWIFI_SYNC_CMD, ch_trpc);
+	if (ret)
+		goto done;
+
+	if (action == NXP_TXPWRLIMIT_ACTION_GET) {
+		u16 hdr_len = sizeof(ch_trpc->action) +
+			      sizeof(ch_trpc->subband);
+		u16 resp_len, skb_len;
+
+		if (ch_trpc->len < hdr_len ||
+		    ch_trpc->len > hdr_len + NXPWIFI_MAX_TRPC_BUF) {
+			ret = -EIO;
+			goto done;
+		}
+
+		resp_len = ch_trpc->len - hdr_len;
+		skb_len = nla_total_size(resp_len);
+
+		resp = cfg80211_vendor_cmd_alloc_reply_skb(wiphy, skb_len);
+		if (!resp) {
+			ret = -ENOMEM;
+			goto done;
+		}
+
+		if (nla_put(resp, NXP_ATTR_TXPWRLIMIT_DATA, resp_len,
+			    ch_trpc->tlvbuffer)) {
+			kfree_skb(resp);
+			ret = -ENOBUFS;
+			goto done;
+		}
+
+		ret = cfg80211_vendor_cmd_reply(resp);
+	}
+
+done:
+	kfree(ch_trpc);
+	return ret;
+}
+
+static const struct wiphy_vendor_command nxpwifi_vendor_commands[] = {
+	{
+		.info = {
+			.vendor_id = NXP_OUI,
+			.subcmd = NXP_VENDOR_CMD_TXPOWER_LIMIT,
+		},
+		.flags = 0,
+		.doit = nxpwifi_vendor_txpower_limit,
+		.policy = nxpwifi_txpwrlimit_policy,
+		.maxattr = NXP_ATTR_TXPWRLIMIT_MAX,
+	},
+};
+
+void nxpwifi_set_vendor_commands(struct wiphy *wiphy)
+{
+	wiphy->vendor_commands = nxpwifi_vendor_commands;
+	wiphy->n_vendor_commands = ARRAY_SIZE(nxpwifi_vendor_commands);
+}
diff --git a/drivers/net/wireless/nxp/nxpwifi/vendor.h b/drivers/net/wireless/nxp/nxpwifi/vendor.h
new file mode 100644
index 000000000000..fdde8e1a7a40
--- /dev/null
+++ b/drivers/net/wireless/nxp/nxpwifi/vendor.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * NXP Wireless LAN device driver: vendor command interface
+ *
+ * Copyright 2026 NXP
+ */
+
+#ifndef __NXPWIFI_VENDOR_H__
+#define __NXPWIFI_VENDOR_H__
+
+#include <uapi/linux/nl80211-vnd-nxp.h>
+
+void nxpwifi_set_vendor_commands(struct wiphy *wiphy);
+#endif /* __NXPWIFI_VENDOR_H__ */
-- 
2.34.1

