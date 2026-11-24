Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795511501;
	b=TOMa1EB3XNLyZyxg8VwNSvKK5PfT5ocGjFrqAWc4n+LUh5cdBG0nOPQrfL48mrYhwYKe
	 6xL0ypvg6vOI+aktMwq2PBSF213r6HI+EW0AJ3wvlvElhW9Tp8kJEx5WKi7WEXydXWQj/
	 jP2/sCWZl8e3fkwlVtkghP/FxcZGLyLvWKzukrThs2Ktsxwiy3Gnczt8XE+pDvidMAxXz
	 xe9LItcANEO4/uzTUjVmkLciY0wTsceIYG4fd9/ggUCtLvtfykkniYVrQwK/i0KVZt1mg
	 sD39sXXbNF8IXT+c9GosF0098NBmVTmir6xf04jlmt3YtViIRe2fE9+F4Xx91EfqIcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511501;
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
	bh=/NwlHcSvwLDDCvKmWPKyEq1ykX8NtQrHHE3umxrF6lI=;
	b=JZ10qiw5udvNh4CKGishPhxQiSoAl+ZaB4jeV/abk1KouVnwE3J2//Yt+R3Xx0sh1pVC
	 MQfA6xLTS/i8BCWw3ed+UaAQAF9Yil6KADe2Ps+sG82YGjHLdgXD7FTE03mrLeRG9sXaZ
	 Xcw9Vdv2cdBMmw/xZd6yJLa+al9iSNSgrEJ+nAPHnxpc6nMN1NZf7/S/iE+9SzQ+UtPoO
	 qm3UAI+sOe4TJkFIiuX81PlDUSY4/05vxI5CLdHaLVdclOXE0wb29ZW1l0pTmPLNZwJy9
	 GzeLo+6ILnEbSwr54F2DL55N1WNpC2tkkaPvVCI4l9sx8EXIHXh9vwWAwAf6QBarsoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="eyI/BdfT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.11
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F867606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F867606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eyI/BdfT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lc8qVIeFfgG72CuVgcWBugzcT9CklNISkFEDsWAztJIt/g0mCOaF4lhXkxfBIe1GfymO9+HrsX4f68v7Xe8X+WkRWKghzhenhWrlbJY/GASWqyAm1JU5mAZ99W0Q3eoya9T37DF3FpL1OI4EeFQGZ6hJBwpUEEsjsyyuxiCT3cIH83AwGRmSyEe7rieebodAzVEeL66KL2Uh7DkR/Zk8+SxHReRGDERwjiIcCxKJB1Sy/AinpjWuVvFhYr6+MFpYvBgYlpbYgD0rnnNGiDi623oLfUQbu1FrmpLfuqAlilr32VgEIt2rY5oQn8oRJDIpECxrWBe9apRIliKHoTD7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NwlHcSvwLDDCvKmWPKyEq1ykX8NtQrHHE3umxrF6lI=;
 b=QJaMPeI85pcCfqOhXT2hYxxUn8gO7C12LpY2H1gwpx2QfhIY+EEpf8b7Mci2hfooTEn0b0TMoPvqbhRV1NQecOSGd1+IqsuvS1HDWOqkCt5p/x9Gfs+gg8uaQRatf9J02KupGwbrX4ecMl172+X89t0obSQT08O92wP391M3VL3mzV6SSt1KVvumwANYSkHLfN0abH6wDXWFM8mD0+xW0+1cfZoxbIg/L10OkWUdU/Q+i4FtwV2nbL/ui3wv89qMDPu9sxgsgq2ogizqtznxweoParEuT0va3dO62R9jE+/P3IbwjmVyyKLj9tK226qKR3vbYQ5bZ9w138hT34rAkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NwlHcSvwLDDCvKmWPKyEq1ykX8NtQrHHE3umxrF6lI=;
 b=eyI/BdfTZQUPHinFxIge+wjY74jyP9Pn8b0sFmsKsdvEhnDBl/nb/XWRP/TVJw4bxxn1FyuHF8XvL5notnMvN23MaiVNO+3O/C93Adb+B0I5HJcb7/T7VAEmwi/8BqEkFNHUopdxhSX9ma4/8ONl2nFimhOQRKH436UYTLzsZ5rRVbGsG/a7BETlqJdfS2d/rRZ2Z+O2bH+of5MzgCMMMmwzHI2AHMz6efAfY92IVfrpclHS6JkimHR3098HSfGbfIRr3L/GytLdsizfJabPuS7oQoiK7XANes0q7zHfLmbOlPh339dddgoPQAxTkkob+kmMqaQsNzX0LpMu/xonLQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by FRRPR04MB12620.eurprd04.prod.outlook.com (2603:10a6:d10:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 09:11:37 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 09:11:37 +0000
From: jeff.chen_1@oss.nxp.com
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	francesco@dolcini.it,
	Jeff Chen <jeff.chen_1@nxp.com>
Subject: [PATCH RESEND,wireless-next 0/3] wifi: nxpwifi: add TX power limit configuration support 
Date: Tue, 24 Nov 2026 17:10:25 +0800
Message-Id: <20261124091028.807981-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::14) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: b2136884-b39f-4dd8-bfb7-08df4a0af1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|6133799003|18002099003|11063799006|56012099006|261102123227099003|261009223027099003|261021121427099003|261022105027099003|261026121527099003|261022075727099003|261021123027099003|261026140227099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	yAnivva7pFlC4eftjwRFu5DW05NSkfTQPvcQULUKkktmDQ+QPk1JoPZTVf6MB7VedLFhUnvF8MOFdPJ97agdigcRqIQVrO5Oi+6yAfuO5L1r+YHK5MmK8eqXZCh5DEMRT0dtPJqRfvBzfThcAZCsZ2rVJnldpcGTqbD+4yP6nVpayu70HseMgGE9nkFXc7z++JRStId0RLWWKun7km4EcSkdYy/pA7gsVY98DF+deWXcrfCH9mcaCEELg+dW+X7mALikyOYgG0ru2e5p6kRZ6QxijEZHNcFFD3h8m/wZMinb3J4ghpqRJ27u59lbiW8sSNH5crmsoc9Wm78s7EgHUok1G7fzryYJuZxjB7W+hRrMyJyFW5+HfYIrmA/n6BOQKaXcc2NDH72LwFF962CqD1bfZcBX+Iang/puRnCEubvshhyqv/DD67ryzwvjqIQjAPyi98jdTQLmWXJG1pTFfxglTt5PCkcH6PW+lI5DvhzpUQoG8X7NwHjfB6lXprjdMEmb8AwDzVoHmQlZu/OZ437qW3xDN3iRKqA5p0Eej0AGoo+FAvPbV2Y7WNdDK3LOIK+H0el3/NQus6BNvF1pd6fmvZ6nELqpSzCqe8GgDZDwB9rjTmoXyL8isc3aFIVy8TMdz6DPk/tzu3jK1+PeXlvcMrFIBVqpcHZEIR1rjIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(11063799006)(56012099006)(261102123227099003)(261009223027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261022075727099003)(261021123027099003)(261026140227099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iA4fK4PzualtYEwv6nLBbAq2Cm1uV/vr80a5rh4O5KAT572UHR+2OtLetuah?=
 =?us-ascii?Q?k/D7kH+o3UWBYnUSI+XPIyO2D4Jj4JLAIx2EzYFkqJz5Ilf3wvDcc5pWZOZR?=
 =?us-ascii?Q?/bjlQTRoxFbDRVgHhkK8oxs6PA2W6Wt8EMLx/nRCEQtbuFFiBjIVp2G5aNOh?=
 =?us-ascii?Q?9L/WfopuKtn7SbcBW5mn+zUiZ25sYWARiC3n9hwms5xRWjMFxAFqB25UbpDg?=
 =?us-ascii?Q?cC4IrB1hkBcRl6QBYCrkqyeK/1duyHSwew0omRRYVvQwBQRCWNMaSu7CW7Jm?=
 =?us-ascii?Q?1ZSPGssl8O0oR20/JELf593YKneXUYhyHDyhGmcKJLksHxcvWevbG+2i7wTa?=
 =?us-ascii?Q?wmwJ8gRN/zmCkn6RCYqVCGE4KkuLBp5R020qmQdjuhbC0bpd3C1DwIFCD+az?=
 =?us-ascii?Q?xcwOAkJDgpctYU0BJxfbcm9aeVdvdgu0XmiS38hHFuMq1ufbzOj7pExoAXsb?=
 =?us-ascii?Q?WSjHKPLX1aWS7uPa6YDKi58LvnvUsHKfJnhFjRlrXj9pZm4/XpG8GcKgB03L?=
 =?us-ascii?Q?aEU3LVN92mE/lO7DEI0w2JR+V/gezkuGBCR6M1AEzJZecqqlmW0XtqpxfGK0?=
 =?us-ascii?Q?PjtnEWWcJuD159W3bhp/0G/7AuCP45OMHhZJHBUdSgQr+auFcmUJjRfY4kGn?=
 =?us-ascii?Q?KVJY8kRTPmz8otzbqH3fLMacofACGL+3wHnJjDqPMW1cwHMPqQ8N4XGGrMms?=
 =?us-ascii?Q?hVG+EC1N3oxKvb3dKwMnMzZVWBDxUDAppw2jgA11jV+RHq2U3t7MhnaFbMWR?=
 =?us-ascii?Q?Pj2gabo+G9ZBDbH9NrozBXGjwHZ6ctqJHR29BeuF6xBlxkEfSqVNsjFulMQ0?=
 =?us-ascii?Q?JmOEVEt5/FL1T6nHIDBKr430VNhwkw7jOC8bzVBls0lLJiLp2XPK7KjCC4zF?=
 =?us-ascii?Q?lBjDCr4mcnP/fNJHUbLISJBu1dhDgQhaOtM8wiM86ZRbqTssuv9HTqxaLrJv?=
 =?us-ascii?Q?lMLt/36E3ulgPVX4weWBkFkbHQx05ydnSEWxdMsOlQY0Ov5h83HHGalwBL8z?=
 =?us-ascii?Q?IW+BUzWmA+zYinh9vIfBIw9DwPHhnCeRlA3dZJcUtHzWvIsJZlHfxSLzew+z?=
 =?us-ascii?Q?Tr6cQYq5gtFEewsM0ogc+C26WIpCS36ZMuCcJy25VAuzSC0tmAQrXvqlJW/P?=
 =?us-ascii?Q?/0jh6nzW5UNGKDoKWDuC/Pu0J3U9IKOs47dpT+UDzB6ujIOIhn7o785a7n7T?=
 =?us-ascii?Q?tFmp4Jd3I9PUuqBqKSuPl6lMwxkM/C/L2DlN9Ck7EBDcsmzCJulbEu9uBcCD?=
 =?us-ascii?Q?6dr/OBbT+dJWzC6umYH9qg1f8N7FFiEFx52xQN75XlFHIl5e4fiaa7yE/Ggq?=
 =?us-ascii?Q?D7Z5xC8dibqIU0yQ6mddOIP1IX4gPGINsIH+eVfgA3jiv3tZdhvCflyEEFJD?=
 =?us-ascii?Q?LwfmbmqeakYOTccjpeGHUQxIf8jS5Fk6754stMHhlc4zhjwwLblPTbjNFPqh?=
 =?us-ascii?Q?hXc93XtngJq7xkOZi+HeeuOY19/tmrZqbEET3GnPLdMAY86LWFLVlS+UWcPS?=
 =?us-ascii?Q?mh+n8vLIyVHkrIsrlrcKcG4I3pPU0u4eJ5k0KKHmRoILXur3NFUL4Ux3eNGG?=
 =?us-ascii?Q?0oMcfAqWEM2J/mZqQiSWlCw1JACo3bTuz9F36lzLj3X7JzLbT+nlf6HGRDYW?=
 =?us-ascii?Q?dUNlinb2orSW6RCrQ1jpelUMKae45k0QUQJB6HJznpJ9Y/luUfU2Vwq3r0ig?=
 =?us-ascii?Q?idUv/taxw77q3ZfglI2AW2vGDFQ3Hvv0Y/+s+g9ldOEPRwJ2y6BWwmQGpUMO?=
 =?us-ascii?Q?KqrqDlSBd7nwpSD0cL4AU8tPF1oUrNhEbMY2LlqkA+BuHGjiQztq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2136884-b39f-4dd8-bfb7-08df4a0af1b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 09:11:37.7454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+GsB5Xj550SLFk9InO85ao1z2pLmU8NgaW+pJM7dwupKzN/Wfz/be2XPaAb8SkA/ldV4646heYEGQErNkJG6QsxwXyPqcFpJtXC1GUYVhDBnybtIwmVZaZQ7jZbPL0A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12620

From: Jeff Chen <jeff.chen_1@nxp.com>

This series adds support for accessing firmware Transmit Rate-based
Power Control (TRPC) configuration through an NL80211 vendor command.

Patch 1 adds common NXP vendor command definitions in a UAPI header.

Patch 2 adds support for the firmware TRPC command used to retrieve and
update TX power limit data.

Patch 3 exposes the TRPC configuration interface to userspace through
NL80211_CMD_VENDOR.

Changes in v2:
- Add a common UAPI header for NXP vendor command definitions.
- Move vendor command definitions from the driver to the UAPI header.
- Address review comments.

Jeff Chen (3):
  wifi: nl80211: vendor-cmd: add NXP vendor command definitions
  wifi: nxpwifi: add firmware TRPC command support
  wifi: nxpwifi: add netlink vendor command for TX power limits

 drivers/net/wireless/nxp/nxpwifi/Makefile   |   1 +
 drivers/net/wireless/nxp/nxpwifi/cfg.h      |  11 ++
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c |   5 +-
 drivers/net/wireless/nxp/nxpwifi/fw.h       |   8 ++
 drivers/net/wireless/nxp/nxpwifi/main.h     |   3 +
 drivers/net/wireless/nxp/nxpwifi/sta_cfg.c  |   8 ++
 drivers/net/wireless/nxp/nxpwifi/sta_cmd.c  |  67 +++++++++
 drivers/net/wireless/nxp/nxpwifi/vendor.c   | 152 ++++++++++++++++++++
 drivers/net/wireless/nxp/nxpwifi/vendor.h   |  14 ++
 include/uapi/linux/nl80211-vnd-nxp.h        |  81 +++++++++++
 10 files changed, 349 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/wireless/nxp/nxpwifi/vendor.c
 create mode 100644 drivers/net/wireless/nxp/nxpwifi/vendor.h
 create mode 100644 include/uapi/linux/nl80211-vnd-nxp.h

-- 
2.34.1

