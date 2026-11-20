Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174712;
	b=3uLMM7pShtuQ3g+wBVY4OQr1vQcldbnsgNkt1KEXA/KejreSeOLuWMIABtjFtfD9I+7r
	 MxZcuoqW0CWO32mR9eF7aDZx83QQEzMNdg3jRHyrdOWltL4OOuuVOVzKD1FLAVdIAHxjF
	 46j1OQ4AChTp1p6RyVqaTBCHNEzsQkQ+8z6vjq8LPfOFHTQX43Opi14oE2ClPEftakZkg
	 EtZA6wcqaPJvTx9B1moPzkcJDaUKItjyJ62FNL677R5qPQlTTTfc+V22PI7AZ98Sy1ED9
	 mWldJMexcVa92hJMRokAa0lUby2rtGbcwGz69ozVw3aA1pTGQFiQtXmIvrLagvLVSPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174712;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:X-CLAM-Verdict:X-CLAM-Score:X-CLAM-Description:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hiCRmoij9JJsnm+BsxGpp9JuhSl9u6krRPLDyg/pLTo=;
	b=ZOmJVDSaqij4bkJVBIzGWZ/NrGD7vQjP7MiGv8p118jq72wLd/lRq6P1bXABWWRkf20y
	 9obBQh5HRj4jDUYmbLQNbgQsk/cvEGrcolx/sgR0ObaMQBZUA9/sYya4obCQbOvkA+931
	 366xNi90oXTHHFbWtsgjiaXxTQDypLOBGe/T6acoQH25Fem7LDsz3Qghhpzn3HXb6tNhG
	 ueBXQcGvu0BtEJjOlv8eulULqaYWd31jInctExUGkJkFqdtt116SBUqwYLTVMsDajCsZc
	 u7v1DkkuW+J1e0nv0FOrvY7RziNlrdLWh9+40wzpBlVuefJeoZ8b9F2lsn2I9V+sVGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b="DJW/PEsI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.62
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCFA606A336
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 11:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BCFA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=DJW/PEsI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0Uer27mRgYZBWF1oAoqNT4PgzkKWD/L+WIq/ZBXZx8254XSi1PXghKcNaZEkVROZi5zTseyNmhyCd3hiYHE7uJoSArxGUKkJiSZJqMbBE+tXruqoyVbe4J/NivZRES4TQ0Xh/d41T6PwNTsy5FNvOusaeLTpU5CoEsGxRQQJxWQpzWIpxrPdPtRpZx2Qx06qKvb7KTJK5i5CrAF1CVHrvrkpIsVmxypdt5R+8E4OCjfpZ9hC9LnpvutcMtn0JYu0lvF1b9BwHrnwOD//4PzJK+Rke5xJyQWNMAa+mZzeJJF7vFwM5sfkLcxn+6vQ8mCGC+qkPFMaD380VGlS/defw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiCRmoij9JJsnm+BsxGpp9JuhSl9u6krRPLDyg/pLTo=;
 b=GH3zz/atHGvzcVCWRKiVUMq56XgGC9GSUhNKSvOdmN0KVz6DAbvJvLW0hf9P1pm9AkgWh1PX70OShbcpacqnAi2GQUSUmvd6tyK1+wYInOnY4/heDofMYyqatv0DJIRR5dKPhj3YExvxgB9MMHOz97FxB6NtQlMTLjdkYN8p3wie3W0WSPETl/R8+BrsL5tcjAsb1f8nhlEhIIHlcMJJjvglIr6oFvV/wGF1C++0c5L8yuUt0fWFIAfWLhPugcBVh10P1pPFYtiMdetOsdhs25u/drJSWV1aTD2GIxMKPwZYEG+t8oEsmzE0+cZt+FoaXdD4jLRKwzsKVYIyq+bjsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiCRmoij9JJsnm+BsxGpp9JuhSl9u6krRPLDyg/pLTo=;
 b=DJW/PEsIOMLFIEslHbysWLyP2lElU3n5at5dls7t5gcmsY++btwvSdST/lkIM2iRY1MVrDjF+if4dIVzGvJFBAZYqfYQXB4LdUssQQs3Rmwd+tMt4oQMOJtxnBbGTANjg6Z5YHl9XHJdGf4eW6oKz1+/sn9sj/ZZ21JJcDgqChA=
Received: from DUZPR01CA0270.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::22) by VI0PR10MB8981.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:23a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 11:38:24 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::19) by DUZPR01CA0270.outlook.office365.com
 (2603:10a6:10:4b9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 11:38:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 11:38:21 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id UDIMxpLoFf0UDUMwfx0Sn8; Fri, 20 Nov 2026 12:38:21 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id UMwfxTcvDbtn9UMwfxpfog; Fri, 20 Nov 2026 12:38:21 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 8C8CD1803CB;
	Fri, 20 Nov 2026 12:38:21 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id 8A2AEFE023B; Fri, 20 Nov 2026 12:38:21 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: linux-wireless@vger.kernel.org
Cc: briannorris@chromium.org,
	francesco@dolcini.it,
	linux-kernel@vger.kernel.org,
	Vishal Gupta <vishal.gupta_1@philips.com>
Subject: [PATCH 1/1] wifi: mwifiex: fix race on scan_processing in mwifiex_scan_networks()
Date: Fri, 20 Nov 2026 12:38:11 +0100
Message-ID: <20261120113811.36916-1-vishal.gupta_1@philips.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|VI0PR10MB8981:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b361fdcc-6973-4360-f67d-08df46fac7e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|56012099006|10067099003|11063799006|5023799004|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	T47XIGm2KmEP3GzUZ7i6UMhEHDZyCJqfNCZ5uTxwmuRugE8L53at2ihqE69t/TCu1I7y62YomPFtvmsVZqWX3C5NVznM+z13ILzTWE0DbdJiqqrtQkRVS3z5OikwVEl70zHwevFZfec9RAbu0GIIiFaYnUTzsiNPeQe1qrv39r+psw8UhVupCMOVlXeg9Ff/zG4/mTTpWflUXQNNpqJpEQ7VuRRzzytWTvhhjbGa3nouvRd7zO/uLdq4syeiJqdkMOezhLHQ6SwjF0BQTguW4frccHGZiBbW1OKeBoL49tSmNbme91hEKsFakC5Qp4mdhNI9ZxA/DoGsGHpTqahHteBe9JVN++GEO1g14bohdvYc8ox/V77ITdaWKPs74dixoHrXhXgQN+659dZFWGsgi/koxM7yqJM9g0TCTjUUfnOlzvfCKQ863a7xhv0XZJRftMznY0FZ22NjjhOzlESi1dWjS/L5ptIcfE7foTYVbzZJsc4gDEGZjEAl3CtLRkoifPr3Rm7Hi68S3d9I1XpVW7fPv4fBAapqXSusVF68NyFCaPrwCiFSDAvofjmcxTdDCOVesqI6gqPbEjS458f7iT0bfX2wN/JcMFyBMXoya1wE//6FW1C72t8O8/gTT4hTuMzVDstfxATuiFpB3JBaIo/7XxmBrUTGCToen8+yK8jZ2OG9MLtakjyd/PQKTOfRmFiJRJXEdls0cwl8CTAMfg==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(56012099006)(10067099003)(11063799006)(5023799004)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6OTEL84jFIV22IHGix7P5SfxjoY5gZ+Mo9pK+wH4FqPI5DXoJGxlWpFEgdyfsQZa7I46l+tt4xjKqzQcPVDeQf4KZkRokXlEH3We+QZpyfgHLelkxXYKGAYWvbkTx+Ijnvf+9AytIJ94rdmDt3KWADeVoalDYnoiLEZxjNPQPwRHJezaiDtfNIVYqPKOyxtm8N9YWrebwqYNhiq47+1F4dgN6duN9XHf8kVG8oVTIsNjuDdhPlLGnRb57YHJT1S4QLsKjDDNMqPSJPxOfwiDk31gIM/wGdszcpf45U00emV6hIP4X6NYRDN59aBljhzdBz8NyPMFTvKcf8vqkLlEraUMuMJA59eQNsAv4leN+2HiJCEqltQPtj6Uj0inxd9CEfKWR2y2orlUNlKDEHYk3O3gR6ANvZaB0Z8meK3fs/XYvd9WaZQPEThUHzxKByt2
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:38:21.9165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b361fdcc-6973-4360-f67d-08df46fac7e2
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8981

mwifiex_scan_networks() tests adapter->scan_processing without holding
any lock and only sets it later under mwifiex_cmd_lock. The test and the
set are not atomic, so two callers can both observe the flag clear and
both start a scan.

This is reachable because callers of this function run in different
contexts: mwifiex_cfg80211_scan() runs from a cfg80211 operation, while
mwifiex_active_scan_req_for_passive_chan() runs from the driver's main
work via mwifiex_check_next_scan_command(), which is not serialized
against cfg80211 operations.

After the last scan command completes, mwifiex_check_next_scan_command()
clears scan_processing and then starts the follow-up hidden SSID scan;
a scan request from user space arriving in that window passes the unlocked
check as well. Both scans then queue commands on scan_pending_q and share
priv->scan_request, so one can clear scan_processing or call
cfg80211_scan_done() while the other is still running.

Move the scan_processing check under mwifiex_cmd_lock, in the same
critical section that sets it, so that test and set are atomic.

Signed-off-by: Vishal Gupta <vishal.gupta_1@philips.com>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index bdd4b8465863b..c99c5378b8486 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -1499,12 +1499,6 @@ int mwifiex_scan_networks(struct mwifiex_private *priv,
 	u8 scan_current_chan_only;
 	u8 max_chan_per_scan;
 
-	if (adapter->scan_processing) {
-		mwifiex_dbg(adapter, WARN,
-			    "cmd: Scan already in process...\n");
-		return -EBUSY;
-	}
-
 	if (priv->scan_block) {
 		mwifiex_dbg(adapter, WARN,
 			    "cmd: Scan is blocked during association...\n");
@@ -1519,6 +1513,12 @@ int mwifiex_scan_networks(struct mwifiex_private *priv,
 	}
 
 	spin_lock_bh(&adapter->mwifiex_cmd_lock);
+	if (adapter->scan_processing) {
+		spin_unlock_bh(&adapter->mwifiex_cmd_lock);
+		mwifiex_dbg(adapter, WARN,
+			    "cmd: Scan already in process...\n");
+		return -EBUSY;
+	}
 	adapter->scan_processing = true;
 	spin_unlock_bh(&adapter->mwifiex_cmd_lock);
 
-- 
2.43.0

