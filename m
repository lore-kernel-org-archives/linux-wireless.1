Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795511504;
	b=EPaLM/k9XlyDZoEqGxLNngI5OmV7ZTwsMh2npgSs8G4+AvtUq7XDI28Ze5VlHoQLW7fG
	 v53rWwvalD/vw9DDq6te3mUSlVBh8801b0me8aQEzlHv67Aa0Uz25coOMYIhHsDfR3Uth
	 aIuwwn5UET1jZjYGak9sIBSLSeqpGgEk697yiecq3MABLe3KQCMant3Ng/bEUt+lEEVN2
	 gPEFVG96E5ityuiN3bTvCEM5aUNnKIIl/f11kcIapeLo6bKnh7HVJZ4xD8DZKtANYxj/Y
	 LyZYcAhB1smCvoTQCDQpCJiXD3qbZdFUSDjBYwK7J0vgKuReA2hFX+7szSR8iGaPj6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511504;
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
	bh=7rAm0FUQf0LN/F72mbwA3WHBoWD1kAAEeWxyb3QDQF4=;
	b=sO+ljMKqcWqINalLBn0SFsgmGPDIu5av+QjO60Kj/TL4ikFUtjRJbomciMVvtcWIjJ/t
	 WB0eMCeuXFMGsuz7Es6GvTiikYDF5w9UYF9FIPpt7xE9eatpSOp93M/gEUYivsIXkMlYH
	 0cI7Q5gv+E7vkSayYLgcVMs/YCg46iP+LpQvxQ2e8fYrpOmWqQgmeluBVaPjE2PTXgQo5
	 iR2uiA8LF9zN5A3DqJcZOaV/Lp1/JqCdf7HXEjSuTGyiXAJ2uKlOkDb8fFvvTwaNd/ugh
	 pknHxwhk9Uw2EshaYuUc2Y5QDytNlZcw98oKWQemiZH/TzH4ue6SQF6Ul9aQRTpgSNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bkz3W50a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.5
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013005.outbound.protection.outlook.com [52.101.72.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB6606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FB6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bkz3W50a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kk9vM0FV4y8VTx5Fax/BV8Bg7aY8jc8DnS4hipng0vpcCi3SVtywofo6EdWgRHKl1hd3UKRPHReBPKKxe+E4yG97TLdazB5yR1ZyI/TMuabgRCFmvWWhqXNEAGHyE3krUscBnKU6n+bu9w0zXLVUuxwWaZhZZWckbjPQkgUV3ks8yANCz3WgnvA8wWJxp61VJtckEsK4kY9RIVQK4dr4BIbxKcLzTJCMgoK/0xFpzwU8TLEiL1k5C/BRLjgqjdjlv24hzsAdx8qvAm8Zt84ZEAjpEnphilE5KGLCgMYjPk9o0KKwGhQ1Ht0Fy+ukEOdiKTE6YaE9lsjh7J2heNffTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rAm0FUQf0LN/F72mbwA3WHBoWD1kAAEeWxyb3QDQF4=;
 b=idi1q1lAuEwl5ib/gngGCaGJ0Wqqqe7vhzWWcnQyRYlaBQyeHNUzWk/i43MrOnp4nv3cjHCO0rh6W43g2HqxODytRyLzKnJFNXUNDWms06D7Q1MucXJIRkmPekZ1HtSFrU2ZfRngZpfs05EG7NUZLFImMgPMqeLNjFIIS5opefsI9bTOKZXBCBKh4/7kNzPHSp6O+wD0kUlqu3bBFjuFcVH2Urxr0tnMqzjkXHC+fd6ZJOnDjOKtWmeU37sIm3ey9uu8OpcxOsKPQhIWE+ttcVdbETkL8K6OuBNbgr7IbObGX+g6xMQG35HZm3HkBMSwxDW8u/JS/cZR0zL9wNkTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rAm0FUQf0LN/F72mbwA3WHBoWD1kAAEeWxyb3QDQF4=;
 b=bkz3W50aZ3f/C04iOJD5fDMO+hLtH7qSrlwiIBgwtaTy1BCWWr1zl0U8J6KZbLWHAJnD1okMSQT/x+GzLN3UQjwVCp1NiQN5rWAtavnW+sYTqxPyNFR5eH1SMlBkZxaA1/O0XQA6IG4H10uACwxZRJh9lkBqDw15PtLq9wFrWonPK110nmm2c2l69hjJ3lDmow5Vi3aBQMrMKPWTeLc8qvVG0vDPXTlcDrS091NDo1S3KLn8cuvq9+kAGxvdp+7NnekQazmU3ZUhaOJ/iT5csmPAw7daMNuzgVOf/2Hy5L+tke/sRha5+nsyBtinVhpPFKKvao1vEH73q0/JJ1XUow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by FRRPR04MB12620.eurprd04.prod.outlook.com (2603:10a6:d10:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 09:11:42 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 09:11:42 +0000
From: jeff.chen_1@oss.nxp.com
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	francesco@dolcini.it,
	Jeff Chen <jeff.chen_1@nxp.com>
Subject: [PATCH RESEND,wireless-next 1/3] wifi: nl80211: vendor-cmd: add NXP vendor command definitions
Date: Tue, 24 Nov 2026 17:10:26 +0800
Message-Id: <20261124091028.807981-2-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124091028.807981-1-jeff.chen_1@oss.nxp.com>
References: <20261124091028.807981-1-jeff.chen_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::8) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ee2806e2-2bf6-4afa-17aa-08df4a0af451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006|261102123227099003|261009223027099003|261021121427099003|261022105027099003|261026121527099003|261022075727099003|261026140227099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ncj8sOK5uDgBQ35GeuBvl5mFLL2xwGxrD2IA2uCH/tV5q5D75tq5wWOVTVNxDmOHYPhiexaLerVxuEUYKyPXGh0uKEcu8vURCsyxd/B92WT7iQqjBdX5QOycLdz469icIfrW+jv7pysh4cNCH/u5XWgQFSEH0jaX44qBxDeeSTHEJyuaOp1ZIwkg6K/VKYw8Q6ly1fJZeSSG6eTzG3oI3rJBc9mc4ffFsLGbC+oIaxTagrLh9AYuqrcUWCT4z9s16KwcmqSicfYCA7B5UBGLbV1FjtU46OgmF20VuLSCvtZRbhmPnpRCYj2wer9hZye+rQl0rYBYDCDpshbEHyoDx8xcUCmnuTTCtjOsC9TSyqWpnwG5nJVg8c/bSfUCW3HHpsxcdjLtVbsw74FoQiG16Y3nZNy9czF1n7fpPbjeWK9CmkF3l0vQ9QeqpVbQ4qROxlivoW1PXhyh44EXFphDM3KYnBatSoKFUP0C++tNAKQbh4RFblCjqLoC5/VhGrwUh9CI5Tyj6Zuk/c1MSRC9ss7G8iI8UMHLpwTtaTR/cDv2LsiR+AxQTzMmm2zaP781BffGHbGt7lN9gcpdkjOD/Og7oAhU8BU0dDWmxNkpG+J+43y0xKeeuYq3fdbgX0hNB1/9njDvhQi8fAB+j+5gS9ItG6XXyM/bXOSfBhjx8HQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(261009223027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261022075727099003)(261026140227099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lPnoyZCVqoo7GqaF5pDPSjTXUiqfbxhn57otv+bic9YvwHwdS4LbEZxIQULN?=
 =?us-ascii?Q?HFUsYiPMKETfor3aCoY7iguxC8iliMjGg/g4hKDbk9RWi/JIQ08PCRwRd6wK?=
 =?us-ascii?Q?UPyMNMYvp//p5sGg1Tki8Qehi9x74U3uz2qA+4yScAsJihKB6t2Bnvk07HM3?=
 =?us-ascii?Q?J4V32WvseY2peRPn7KMORr05lBd7IaJrUfNdiMluVhAVnB8yfWk4w9zfZXkI?=
 =?us-ascii?Q?/ehifXJyKmY0xdfyEkZ+9PEN3sbjqM44idvyLUZBMZyquQBbnxgt2wLikex9?=
 =?us-ascii?Q?a+TE+5B+Z8EoCH1GVTFdyKAPsbzzo4XZzqerMXNoNJrR3dW3lTDfM/Y9ITJB?=
 =?us-ascii?Q?GRzor8zQ5+roeaVOjXqIGXenltnew93+Qh3wE4UDvpxHbXfOUasMz4eE+863?=
 =?us-ascii?Q?z2zk3mFrMj0fniHm8SKLLW7T17I1wUawy3EoD4rw9ACmrpCvXcQlMTHf2LrI?=
 =?us-ascii?Q?dnqHnpnuPQMq8PuFkQp6xqAhEXmaZPU2AJ3lheo54ePmetlynqLwydFCTG3d?=
 =?us-ascii?Q?BKjGbyEcs/p2YglaMSY0a+QJMemsv9SUuB4Q+aE/6huqgXJRl/iqGWnVW6+e?=
 =?us-ascii?Q?gCyOfZbS4SDMG5JdtVqExbze1ZuBbzM4jU7TTGQkywZwfABfHsGoCy3Mjxdi?=
 =?us-ascii?Q?fIGoDyklx4fiRO83wEhPBTeD153GCRjAXEkXGbA4SIJz0eKx5U31OYgVgKrD?=
 =?us-ascii?Q?zjSSHEiJpw76SEG06ITRLedz/OFjcxMgFx1X8bb2x92gmI4piIZZgzz5HuGe?=
 =?us-ascii?Q?vvfTgdFNMxl8bAf3ooS0NaqhG+lRka0TaOPjLkK4pa3/FQ4B9kQdQBY8yJRB?=
 =?us-ascii?Q?dehKlefGFCGC/m0VOOF8T6dr3fU+wmiI7eMlLp4YudKpoAaumwxaKMqKxW1x?=
 =?us-ascii?Q?Pfjw5y5nTWPxxg0mhRATIlLxI+FaIkKuyitnUQ4CynZp0uENHJojmwD6ju4U?=
 =?us-ascii?Q?KkHv4r5kDmF4bWOtZaHmbYt/pDttzV7VL2g4vLEh8CTFZW4/PC3CMugyA0ih?=
 =?us-ascii?Q?hVmN7UG4uNZnl9F1dDHiYOAFJIE39kxJfiZSujnSKPzDOUk2jW8ufjGhJISL?=
 =?us-ascii?Q?9qhx3l1ZMjC74tRUlaOpT+OamN2ehZc8AuT24Ca/NqIkzru0NHb9fQHxYj/P?=
 =?us-ascii?Q?ITxaAgLIw4yZ8MmGEytOzlwTKc40NsTdrewrPTN60hU/hZSJ3r67kth+6tgG?=
 =?us-ascii?Q?5HEDiDVoqifGKsJXLio1s6CllCI/aoVAj8beZncC9A+npWUPXZv5LMsCtNCt?=
 =?us-ascii?Q?61+PXf0fR9PxZ1UzBr1JCjFDHfQpGcDhBdcTHXGv1IxO6qyC9UDQ29XTGMmd?=
 =?us-ascii?Q?bRPv01UDQdM/9p8NlQmpNckQImkW/dRPu/OGfrSrfoWPcbHKIxMJghodROiq?=
 =?us-ascii?Q?rS6GvlOhWIoMbt70OzxsjiyzqB0kKBFIP7VW6TXAnQAhi8Zyav6HsmRMf+QG?=
 =?us-ascii?Q?kPstFm6n/PhWrNn4TPdkxyaZ5l9Ff+iV/o7G4bBCu9YkmFVyyQuQZ38p5alh?=
 =?us-ascii?Q?fRtnKsmseDizMGVFxQik5OIb1z/mTTvQ8NMzN5+8ec5PIDGuXMafl0yzQPB9?=
 =?us-ascii?Q?2AVJIqKrfHBfH5LojKzgRU2eUsQF+NH2ZpPxkscTJp20X8VpFqcwqgdq0uK1?=
 =?us-ascii?Q?HX2VUaqNEcF3L42/ahpz/5YyeRBMOgsKkMuxd2CVHvGBXWWBmr5f+KWYiU35?=
 =?us-ascii?Q?Mh/l5OvNB68/6HgETRX4jPrlWRDwvHh4+O+A0j1zk3JMdBk/1t6/Bl5D1cxZ?=
 =?us-ascii?Q?qgXK2DadVOiWF0+LG98w5YgNXoO9h4Cc1UYOUvnp+GiN7lGwjhfL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2806e2-2bf6-4afa-17aa-08df4a0af451
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 09:11:42.0538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLkeOUfI/5+o3zX88wg6bpN+2rwrP7iJ49sNAQDjCXOlqQvAYEfaX/p3vOs9YlvDsHxW6jb5AgkamKLh5vDJhMZSWPImqH/8pbbRHtPDaehD+9AbxzeJA+ah87zRovGO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12620

From: Jeff Chen <jeff.chen_1@nxp.com>

Add NXP vendor command and attribute definitions for use with
NL80211_CMD_VENDOR.

The initial user of this interface is the Transmit Rate-based Power
Control (TRPC) configuration command.

The TRPC table is a firmware-defined ABI that contains TX power limit
data. Existing nl80211 TX power interfaces allow TX power levels to be
configured, but do not provide an interface for exchanging TRPC table
data between userspace and firmware.

Therefore, the TRPC configuration interface is exposed through a vendor
command. The kernel does not interpret the TRPC table contents and only
passes the table data between userspace and firmware.

Example use cases include:
- Reading firmware TX power limit configuration for verification.
- Updating platform-specific TX power limit tables.
- Supporting manufacturing, validation, regulatory, and platform
  bring-up workflows that require access to firmware-defined TX power
  limit data.

Signed-off-by: Jeff Chen <jeff.chen_1@nxp.com>
---
 include/uapi/linux/nl80211-vnd-nxp.h | 81 ++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 include/uapi/linux/nl80211-vnd-nxp.h

diff --git a/include/uapi/linux/nl80211-vnd-nxp.h b/include/uapi/linux/nl80211-vnd-nxp.h
new file mode 100644
index 000000000000..4e18d0f5af03
--- /dev/null
+++ b/include/uapi/linux/nl80211-vnd-nxp.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * NXP vendor command definitions for nl80211
+ *
+ * Copyright 2026 NXP
+ */
+
+#ifndef __VENDOR_CMD_NXP_H__
+#define __VENDOR_CMD_NXP_H__
+
+#define NXP_OUI		0x006037
+
+/**
+ * enum nxp_vendor_cmd - supported NXP vendor commands
+ *
+ * @NXP_VENDOR_CMD_TXPOWER_LIMIT: Access firmware Transmit Rate-based
+ *      Power Control (TRPC) configuration. The command uses the
+ *      attributes defined by &enum nxp_txpwrlimit_attrs.
+ *
+ *      SET operations provide TRPC table data through
+ *      %NXP_ATTR_TXPWRLIMIT_DATA. GET operations return the requested TRPC
+ *      table in %NXP_ATTR_TXPWRLIMIT_DATA.
+ *
+ *      The kernel does not interpret the TRPC table contents and only
+ *      passes the table data between userspace and firmware.
+ */
+enum nxp_vendor_cmd {
+	NXP_VENDOR_CMD_TXPOWER_LIMIT,
+};
+
+/**
+ * enum nxp_txpwrlimit_action - operation for %NXP_ATTR_TXPWRLIMIT_ACTION
+ *
+ * @NXP_TXPWRLIMIT_ACTION_GET: Retrieve the TRPC table for the selected
+ *	subband.
+ * @NXP_TXPWRLIMIT_ACTION_SET: Update the TRPC table for the selected
+ *	subband using data from %NXP_ATTR_TXPWRLIMIT_DATA.
+ */
+enum nxp_txpwrlimit_action {
+	NXP_TXPWRLIMIT_ACTION_GET,
+	NXP_TXPWRLIMIT_ACTION_SET,
+};
+
+/**
+ * enum nxp_txpwrlimit_subband - firmware TRPC subband selectors
+ *
+ * The selector values are defined by the firmware Transmit Rate-based
+ * Power Control (TRPC) interface.
+ *
+ * @NXP_TXPWRLIMIT_SUBBAND_2G: 2.4 GHz band.
+ * @NXP_TXPWRLIMIT_SUBBAND_5G_0: 5 GHz subband 0.
+ * @NXP_TXPWRLIMIT_SUBBAND_5G_1: 5 GHz subband 1.
+ * @NXP_TXPWRLIMIT_SUBBAND_5G_2: 5 GHz subband 2.
+ * @NXP_TXPWRLIMIT_SUBBAND_5G_3: 5 GHz subband 3.
+ */
+enum nxp_txpwrlimit_subband {
+	NXP_TXPWRLIMIT_SUBBAND_2G	= 0x00,
+	NXP_TXPWRLIMIT_SUBBAND_5G_0	= 0x10,
+	NXP_TXPWRLIMIT_SUBBAND_5G_1	= 0x11,
+	NXP_TXPWRLIMIT_SUBBAND_5G_2	= 0x12,
+	NXP_TXPWRLIMIT_SUBBAND_5G_3	= 0x13,
+};
+
+/**
+ * enum nxp_txpwrlimit_attrs - TX power limit vendor attributes
+ * @NXP_ATTR_TXPWRLIMIT_UNSPEC: Unspecified attribute.
+ * @NXP_ATTR_TXPWRLIMIT_ACTION: Operation from &enum nxp_txpwrlimit_action.
+ * @NXP_ATTR_TXPWRLIMIT_SUBBAND: Target subband.
+ * @NXP_ATTR_TXPWRLIMIT_DATA: Firmware-defined TRPC table data.
+ */
+enum nxp_txpwrlimit_attrs {
+	NXP_ATTR_TXPWRLIMIT_UNSPEC,
+	NXP_ATTR_TXPWRLIMIT_ACTION,
+	NXP_ATTR_TXPWRLIMIT_SUBBAND,
+	NXP_ATTR_TXPWRLIMIT_DATA,
+
+	__NXP_ATTR_TXPWRLIMIT_AFTER_LAST,
+	NXP_ATTR_TXPWRLIMIT_MAX = __NXP_ATTR_TXPWRLIMIT_AFTER_LAST - 1
+};
+
+#endif /* __VENDOR_CMD_NXP_H__ */
-- 
2.34.1

