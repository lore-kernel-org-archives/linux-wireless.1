Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795511509;
	b=XAhFzjLvqSAXZqVXsQSPfl9ALBGLlSQ7e16iBpb8xa2lepaRW3uEb/uDJZXZk+8Zn1fu
	 cEgq4JZW+N0Az9B207IKurQHJYVcen4hfQ0CevFIlkalhtUBGInX7GOkpul5wAOIBuWl0
	 hNTk8JMBiJcDffQyR7JYmuglUNgQGlgEHvCLxqH/9vPBp3vRnGr/dcA1OpU+qZwPUfvZM
	 ffOHnj0xYCHqzwhpyx0EOg4PNYyGUhRq5AcsNdgiUtgcmTlNXvQnQJCBwUuS7m3xA+8Jv
	 da9CI+KosodHn2Uc1UJDDfBP4SYHyvriTXrhMAQA3hxqSAFao1F/cFyLTNqTDDzU7xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511509;
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
	bh=WJz40g5zC8Pp2RorhX6C9b1FxUrxM93+qBlMtCMdUB4=;
	b=jh+3iP5LhKAumPWgnsYDOzfn/IBtjTEgjY503DQckuC9TJjkw0IChIliv1w2Sq5X/tCT
	 wEo2YzdR5W1gaJJ2MDEXlKSsAMAAK/qGu8BD9/5X+gqjNUSBxloLBIU9u1sz6alThYsrI
	 F5gYl2gOkEWzVogWCDCtpmaoxzmGROviHR//OEDFf5186dq3DY7A1DzDNg/dqy9W6DeBe
	 aYez6VOKQauVBiJRfNUMfnOuiYqseQ44FXVKDttO49Uz+7DSxQor2uaW23eNmvt+lGrMi
	 XVpZvOD6jCVWRhwmbxfs/e7XzTDYaGr8zUZ9nzDwSdrA85f/1twjNcD9e07sKCILU6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GCQrVmLb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.25
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66328606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66328606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GCQrVmLb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlm2MHBg6f1hmWD7+y/upy6GhxqpS1yUl+x3VT9Cbzc/er7Gr+MsE2Ur5zUyfTfex3Z+vjOMQLChw6/de3G63Src7hkuCSvcj+kArSJZyQ6FXx3rqJznoDJoslRi69GF7kNA4lIENDJvVywGwG/kL/aFBcDiGWaAAfv/e1yfB1XKL5EzocY4Vk8u3zLGyFQDaDutkxdE0g3Q8cGzASAzZGBZus+FMoo4ZwMQNGPHjGIx0PnHbI3wr7ULtYO/rk1Y1btH+62tLOzDIawiF2LGvN9085itaAUHp98IlIRGKKs7oid5FDV+ob+6A4zrpVXNUmYTNKFwV53dGbOuiJ0tVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJz40g5zC8Pp2RorhX6C9b1FxUrxM93+qBlMtCMdUB4=;
 b=QbxUYBgQ1lUvQ72Ze35N/mjARYqMjB6gQEr9AB6LU1VNwwsy4ADqx6B6Tt02cgaCFAslDhuoYQl/A6dP3yEquXCoc5E62HWMeyak6w/DXWLX+bhY/caIIUyMWPS4L8KU34Mpd02uUlzXs93dqRgp8TeuYwWIc75TA92fuDNyoFgHP6n4M/be445e4eaaV64idekha+ovj47tyNnaNDQCjnki09qiXk4K/8VN0B/KTFYxXwdBCm+myGI3Mm1Xpz+SBQbvIBsFBQTg6KulaeRW9RjhxRfk9Q+nTPx6kyNLO5xpySPYBk9JuQpas+xigmqD8zAAUtLxrJgYkTvYl29BCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJz40g5zC8Pp2RorhX6C9b1FxUrxM93+qBlMtCMdUB4=;
 b=GCQrVmLben7okADZAGCucq8hsDsh9QzlddxA78dAugIVbNoA9XK6UhVxK7nbGl6dwIF6Pz70jmUeEjKEpq/ItxobBYWtZyWzdmGf9XAt+EmRb123Kpqc0BeTyiRXNuqQuolaY1LOMcikW5JQAPB5mz6zGMv8nYCA3mwd2W2JkyLpjrrKzvicN6Sg0TwAChQ7jDqWQvO/vMVvSKU+lxDxq8ji5/vIfyCi31gZlPhW9Ekxpd6NKs8LLguUh+CAdUAguyTxRZ+vTCiMEsJvVNGgigjSVTyYYRE9fuctigE1EV/epUvETR/Egmp5UyfMsGIkD/V4zHTXLkvy71ePElTQHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by FRRPR04MB12620.eurprd04.prod.outlook.com (2603:10a6:d10:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 09:11:46 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 09:11:46 +0000
From: jeff.chen_1@oss.nxp.com
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	francesco@dolcini.it,
	Jeff Chen <jeff.chen_1@nxp.com>
Subject: [PATCH RESEND,wireless-next 2/3] wifi: nxpwifi: add firmware TRPC command support
Date: Tue, 24 Nov 2026 17:10:27 +0800
Message-Id: <20261124091028.807981-3-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124091028.807981-1-jeff.chen_1@oss.nxp.com>
References: <20261124091028.807981-1-jeff.chen_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::31) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: c2762577-e7ac-4c50-7523-08df4a0af696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|261026135527099003|261102123227099003|261022113327099003|261026130827099003|261009223027099003|261021133027099003|261022115727099003|261021130227099003|261021121427099003|261021135927099003|261022105027099003|261026121527099003|261022075727099003|261021123027099003|261026140227099003|261009221227099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PMk/WcttYOCX5KdtXSyDm8HLZJ5PBbUTzXVnZC8aUER/sCgkJZEvEpki2ljIdTOBt8DlDgH2ihRCKwhcdeuwnKx7OLVBgQli6ft1ok8c8vKRvRhl949jyfseZcGrAeQYRPpvAhXixLkRLMnDq0L52xDXoSMTnrWlH/UeMnxrowQ/4+NgO11BIMsYWysPCbv6AkTLABXEz9z6tbSR44aehcrxqKgb5zT10wtkX+apfRM8e17SV5/kUBUaTHJ2o/GMceowrlbcXLxTSxbO4/aWCQYUIZ08UtpVAzQSrQzGpj6rm3VPkJ3M1SgRFdTm2D4LNxNNac7zh49VOid9WMo3GRQoroTGh4Iitx3wJHcdKhHNnCeuqF1paIca0gmFzTkuZeoinXbtD0y3C8m8AGUdB5NG3n3hwEy029jmbUOORW8nxrGQkzo1TBjJx9j+ukDiHeuUfozjyQfU6/RrwXB9wym5Q7wMTTZ1BkeUo5lKf0/VxfhfgH6kj7iR9W9tP1d5emXSTw2IAnIb9KMf8qohnOouGRZPQZclP05dycjdSoSiVRWIGoFvFJWe+xDXNaBFRwLbhKXhdgG8XpnXk/C6yR4/ODr43BFb8u5Aciub9/6WU/VKW2PoI9IJf6Fh+16OC56Lw2NvI2Ji6/i89szx9XAEsKCOX2RtenhyQVe7l5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(261026135527099003)(261102123227099003)(261022113327099003)(261026130827099003)(261009223027099003)(261021133027099003)(261022115727099003)(261021130227099003)(261021121427099003)(261021135927099003)(261022105027099003)(261026121527099003)(261022075727099003)(261021123027099003)(261026140227099003)(261009221227099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?csy7vnphwBbKjsA6QMz5Q4Gb+v8PChVO6zzY4AEcQA+S1bpHhaiOSka2uSgx?=
 =?us-ascii?Q?JeO40iXYqLz0FNHfcLEoK+TwIbxhjIH4jmkJUp5pkxHV4Q98Bce+7+LWt4HG?=
 =?us-ascii?Q?pcvJOqzvKD1JZtjeiahll8wo4DjzVYQCKge1G3vpNg4QBysnem3b+XpiaNY5?=
 =?us-ascii?Q?K6sKNaRhn+Egw5Sm86V58mBd542U1tDtJ3zK9Iy0VSx6M+Bb8jk0UibuUkTw?=
 =?us-ascii?Q?N1rgiveNV0eAl69ZM2uWUdz3LWUtci/oTyNIV7LNh938uqV3ldTKaVrY1QI2?=
 =?us-ascii?Q?ebGiCFftWTmbiVYluMIwPemkEV0HoPWjfjhqTYPmvhvYxQzuzYKH0Ytkh2JQ?=
 =?us-ascii?Q?ryLkPqmsX4xrsMyVsFg/SfaDha3eqCKxblHEiZQbctB+639Tvoru7YQiodP9?=
 =?us-ascii?Q?caxu3J2PyOfGcl3HVgugxzd1w2p+9bIF11EYTdpbTRqkXQwAhgjnJZExhjGl?=
 =?us-ascii?Q?LpQp9EmmVgwQ94BW8HfJ+FVdGRfrT6DmmOjhem3J92i4gZ4kNrF5LnvwHnoP?=
 =?us-ascii?Q?vFbm5y6DOWb++jBo5K2i1YPWMHGScgmt7NFT3m1JHvGuqaW3RGzhD34RFSNY?=
 =?us-ascii?Q?AOSWkswx/i5Im557Dmy8+dU3eoai8UGATNuttuRu5p+Nz2M6Lf8StQ2eUBiO?=
 =?us-ascii?Q?KY5s44Mxym4L++Hjssyh1zXuqpKnm3KL819pvEZC1A0iXPq5DEWTG3P6lqHU?=
 =?us-ascii?Q?mhxytrr0KBE4mqN3EkqE/0HkPf12mECWVLeZzsKXjPeqW5bQlgy+4XhRvw+0?=
 =?us-ascii?Q?AuoXGMHBZgO1rt2CqVA0NzD0v7DRnz0YN8tqWb89jXdm2hB0CSIVNcEYAZ3O?=
 =?us-ascii?Q?3Ag0riwiOrYqqJfbML8SVLow7oFzMLxLL//cwzQ6u057T9ieyq/nAk26CoZU?=
 =?us-ascii?Q?J1lwKab7hkhVsn6IHheM7P4tW/v6TnsBk9LrjX70zlOS3HGCUlbN6ZqPSLms?=
 =?us-ascii?Q?DMEPzIKvNV+nViQVNTHHZW1QZjNRqyBmFNlAlhI352fZPT8nURw6EEjpC0xg?=
 =?us-ascii?Q?E3J36Gc8EBy7EbH0kgtlqabBckEKdivPoETJs5trFmH2AA3DF6j5AOGhFOnS?=
 =?us-ascii?Q?y9fmlLedONeXW4RMzq8Qp/RR5wKj6NuowvWdBNma/gpEXGNS3Rsirgjv/V9+?=
 =?us-ascii?Q?Bdt0SU19w3PZLEa7sBxY9TgbwSaeSD3qnmEPi4FTseIL9kE+E+nTM2FNT+zS?=
 =?us-ascii?Q?tamWpVdXkDzyR/KpKSrakmJfiSBB3yRgUXGf7DG64Na7V2fKuL+kzXzi0jYT?=
 =?us-ascii?Q?eOEvyoOI4RYCe8Tk6pZUp+KogTKGv45njOQF5ms13IMcbWwv3A7klWSUQCzd?=
 =?us-ascii?Q?SiaZTpG2WUecOhUFwYLIpKgT3dOGgZ/WvZZCGpaCoc4T03xeE7iaq5+ZaZel?=
 =?us-ascii?Q?5EeORqMtVcfCQvsUD8SHXeShJsRd+zkxmhojEG/8Sq36Hth4MPNM2pWDKEko?=
 =?us-ascii?Q?Eh+JAUsJlFmIUEkQJs7kWvsyl0kPlQV0C/cA65/pw1bU9icsfKYFkUjCd1XO?=
 =?us-ascii?Q?iRyG8/l9F4ByPSRVFdjoMpwcF3aqqN+g4N3pcMa6acSI3nJtJeog7WMcHX0R?=
 =?us-ascii?Q?LIeJu3Lcn/tZNKgPFInMi5V4I7sa2BM3YxjKsbM/6y4JYqIPOtOzkICPEldF?=
 =?us-ascii?Q?eaLb7FyKBmmix9jlAUtAvyzw5elLFp1NVbtGDske4HhVjwCDBzi7wem8GiA3?=
 =?us-ascii?Q?A2OYiHxaXmfn5fy4504BURXQy6XZscIOwcbLW7n0mBM9n0j6Xumlc4dp7fQu?=
 =?us-ascii?Q?ZZoN1ppKdjeNWWpDCDYboimiUNfxsx4lXXZtJihivUkIJHmWWHDg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2762577-e7ac-4c50-7523-08df4a0af696
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 09:11:46.0531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pbsTMjIDa5k9W6ulFbUaeGMQOx9ve10pnISvwjUxh23gvUNrTfa7FZEZckFmCyU9wpn/f8BbDL1f97SQf87cJDGLzoPOu9uUcvBGV6+AiOvzer5U/BMfBE1mE5qJfQ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12620

From: Jeff Chen <jeff.chen_1@nxp.com>

Add support for the firmware TRPC configuration command used to
retrieve and update TX power limit data.

Signed-off-by: Jeff Chen <jeff.chen_1@nxp.com>
---
 drivers/net/wireless/nxp/nxpwifi/cfg.h     | 11 ++++
 drivers/net/wireless/nxp/nxpwifi/fw.h      |  8 +++
 drivers/net/wireless/nxp/nxpwifi/main.h    |  2 +
 drivers/net/wireless/nxp/nxpwifi/sta_cfg.c |  8 +++
 drivers/net/wireless/nxp/nxpwifi/sta_cmd.c | 67 ++++++++++++++++++++++
 5 files changed, 96 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg.h b/drivers/net/wireless/nxp/nxpwifi/cfg.h
index 8627a3372978..4c0558ed483e 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg.h
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg.h
@@ -755,6 +755,17 @@ struct nxpwifi_ds_coalesce_cfg {
 	struct nxpwifi_coalesce_rule rule[NXPWIFI_COALESCE_MAX_RULES];
 };
 
+/* Host-side helper for the channel TRPC command. */
+struct nxpwifi_ds_chan_trpc_cfg {
+	u32 len;
+	u16 action;
+	u16 subband;
+	u8 tlvbuffer[];
+};
+
+/* Upper bound on the TRPC TLV table exchanged with the firmware. */
+#define NXPWIFI_MAX_TRPC_BUF (4 * 1024)
+
 struct nxpwifi_11ax_he_cap_cfg {
 	u16 id;
 	u16 len;
diff --git a/drivers/net/wireless/nxp/nxpwifi/fw.h b/drivers/net/wireless/nxp/nxpwifi/fw.h
index 124728a72442..82641b28259f 100644
--- a/drivers/net/wireless/nxp/nxpwifi/fw.h
+++ b/drivers/net/wireless/nxp/nxpwifi/fw.h
@@ -388,6 +388,7 @@ enum NXPWIFI_802_11_PRIVACY_FILTER {
 #define HOST_CMD_CAU_REG_ACCESS                    0x00ed
 #define HOST_CMD_SET_BSS_MODE                      0x00f7
 #define HOST_CMD_PCIE_DESC_DETAILS                 0x00fa
+#define HOST_CMD_CHAN_TRPC_CONFIG                  0x00fb
 #define HOST_CMD_802_11_NET_MONITOR                0x0102
 #define HOST_CMD_802_11_SCAN_EXT                   0x0107
 #define HOST_CMD_COALESCE_CFG                      0x010a
@@ -2375,6 +2376,12 @@ struct host_cmd_twt_cfg {
 	u8 val[];
 } __packed;
 
+struct host_cmd_chan_trpc_cfg {
+	__le16 action;
+	__le16 subband;
+	u8 tlvbuffer[];
+} __packed;
+
 struct host_cmd_ds_command {
 	__le16 command;
 	__le16 size;
@@ -2449,6 +2456,7 @@ struct host_cmd_ds_command {
 		struct host_cmd_11ax_cmd ax_cmd;
 		struct host_cmd_ds_802_11_net_monitor net_mon;
 		struct host_cmd_twt_cfg twt_cfg;
+		struct host_cmd_chan_trpc_cfg ch_trpc_cfg;
 	} params;
 } __packed;
 
diff --git a/drivers/net/wireless/nxp/nxpwifi/main.h b/drivers/net/wireless/nxp/nxpwifi/main.h
index b25a6a4f2936..9ae017bdc6ca 100644
--- a/drivers/net/wireless/nxp/nxpwifi/main.h
+++ b/drivers/net/wireless/nxp/nxpwifi/main.h
@@ -1415,6 +1415,8 @@ int nxpwifi_get_wakeup_reason(struct nxpwifi_private *priv, u16 action,
 			      struct nxpwifi_ds_wakeup_reason *wakeup_reason);
 int nxpwifi_get_chan_info(struct nxpwifi_private *priv,
 			  struct nxpwifi_channel_band *channel_band);
+int nxpwifi_chan_trpc_cfg(struct nxpwifi_private *priv, int cmd_type,
+			  struct nxpwifi_ds_chan_trpc_cfg *ch_trpc);
 void nxpwifi_coex_ampdu_rxwinsize(struct nxpwifi_adapter *adapter);
 void nxpwifi_11n_delba(struct nxpwifi_private *priv, int tid);
 int nxpwifi_send_domain_info_cmd_fw(struct wiphy *wiphy, enum nl80211_band band);
diff --git a/drivers/net/wireless/nxp/nxpwifi/sta_cfg.c b/drivers/net/wireless/nxp/nxpwifi/sta_cfg.c
index 56cf63fbf7fe..650de6156912 100644
--- a/drivers/net/wireless/nxp/nxpwifi/sta_cfg.c
+++ b/drivers/net/wireless/nxp/nxpwifi/sta_cfg.c
@@ -1175,3 +1175,11 @@ int nxpwifi_get_chan_info(struct nxpwifi_private *priv,
 				HOST_ACT_GEN_GET, 0, channel_band,
 				NXPWIFI_SYNC_CMD);
 }
+
+int nxpwifi_chan_trpc_cfg(struct nxpwifi_private *priv, int cmd_type,
+			  struct nxpwifi_ds_chan_trpc_cfg *ch_trpc)
+{
+	return nxpwifi_send_cmd(priv, HOST_CMD_CHAN_TRPC_CONFIG,
+				ch_trpc->action, 0, ch_trpc,
+				cmd_type == NXPWIFI_SYNC_CMD);
+}
diff --git a/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c b/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
index 9bfa4aebc3e5..8ac5008e0081 100644
--- a/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
+++ b/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
@@ -3033,6 +3033,70 @@ nxpwifi_ret_sta_twt_cfg(struct nxpwifi_private *priv,
 	return nxpwifi_ret_twt_cfg(priv, resp, data_buf);
 }
 
+static int nxpwifi_cmd_chan_trpc_cfg(struct nxpwifi_private *priv,
+				     struct host_cmd_ds_command *cmd,
+				     u16 cmd_no, void *data_buf, u16 cmd_action,
+				     u32 cmd_type)
+{
+	struct host_cmd_chan_trpc_cfg *chan_trpc_cfg = &cmd->params.ch_trpc_cfg;
+	struct nxpwifi_ds_chan_trpc_cfg *usr_chan_trpc_cfg =
+		(struct nxpwifi_ds_chan_trpc_cfg *)data_buf;
+	u32 hdr_len = sizeof(chan_trpc_cfg->action) +
+		      sizeof(chan_trpc_cfg->subband);
+
+	/* usr_chan_trpc_cfg->len covers action, subband, and TRPC data.
+	 * Reject lengths outside the supported command payload range.
+	 */
+	if (usr_chan_trpc_cfg->len < hdr_len ||
+	    usr_chan_trpc_cfg->len > hdr_len + NXPWIFI_MAX_TRPC_BUF)
+		return -EINVAL;
+
+	cmd->command = cpu_to_le16(cmd_no);
+	cmd->size = cpu_to_le16(S_DS_GEN + usr_chan_trpc_cfg->len);
+
+	memcpy(chan_trpc_cfg, &usr_chan_trpc_cfg->action,
+	       usr_chan_trpc_cfg->len);
+
+	return 0;
+}
+
+static int nxpwifi_ret_chan_trpc_cfg(struct nxpwifi_private *priv,
+				     struct host_cmd_ds_command *resp,
+				     u16 cmdresp_no, void *data_buf)
+{
+	struct host_cmd_chan_trpc_cfg *chan_trpc_cfg =
+		&resp->params.ch_trpc_cfg;
+	struct nxpwifi_ds_chan_trpc_cfg *usr_chan_trpc_cfg =
+		(struct nxpwifi_ds_chan_trpc_cfg *)data_buf;
+
+	if (chan_trpc_cfg->action == HOST_ACT_GEN_GET) {
+		u16 resp_size = le16_to_cpu(resp->size);
+		u16 resp_len;
+
+		if (resp_size < S_DS_GEN)
+			return -EIO;
+
+		resp_len = resp_size - S_DS_GEN;
+		/* The firmware response contains action, subband, and TRPC
+		 * data. Validate that the payload length is within bounds.
+		 */
+		if (resp_len < sizeof(chan_trpc_cfg->action) +
+			       sizeof(chan_trpc_cfg->subband) ||
+		    resp_len > sizeof(chan_trpc_cfg->action) +
+			       sizeof(chan_trpc_cfg->subband) +
+			       NXPWIFI_MAX_TRPC_BUF) {
+			nxpwifi_dbg(priv->adapter, ERROR,
+				    "chan_trpc bad resp len: %u\n", resp_len);
+			return -EIO;
+		}
+
+		usr_chan_trpc_cfg->len = resp_len;
+		memcpy(&usr_chan_trpc_cfg->action, chan_trpc_cfg, resp_len);
+	}
+
+	return 0;
+}
+
 static const struct nxpwifi_cmd_entry cmd_table_sta[] = {
 	{.cmd_no = HOST_CMD_GET_HW_SPEC,
 	.prepare_cmd = nxpwifi_cmd_sta_get_hw_spec,
@@ -3217,6 +3281,9 @@ static const struct nxpwifi_cmd_entry cmd_table_sta[] = {
 	{.cmd_no = HOST_CMD_TWT_CFG,
 	.prepare_cmd = nxpwifi_cmd_sta_twt_cfg,
 	.cmd_resp = nxpwifi_ret_sta_twt_cfg},
+	{.cmd_no = HOST_CMD_CHAN_TRPC_CONFIG,
+	.prepare_cmd = nxpwifi_cmd_chan_trpc_cfg,
+	.cmd_resp = nxpwifi_ret_chan_trpc_cfg},
 };
 
 /*
-- 
2.34.1

