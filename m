Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794504112;
	b=eDTBEyKmGqw5X8W8Zyq/nCWJLFBTHbg/dmk7nOeUfXK/LVmwZ7AopTaXrmhpaslU+ymp
	 odVSLPDyVrwBNlHNcloJXCyy1hCYXTG7Ij1VnWseeZZqkq7hJHT0nzZ1qoGeq2Sa1isF5
	 FP4qskz1D4I2pwfThw39I5E3OmFc1oVij7NAaPvOMQdZaOoDJwiXUCzCafwtER7jL/dWs
	 RXQhabw7qyvU1bVfwue67qzK5zzFI/Erhi1xtRFb6bDLOkMTAv+ERl1lw+G3VCdDrSlFL
	 sEyocu2+6WH25eQoRTB5XHcZkZflE0esIiGk/DIwMp9ZgGT7BHgE5FOIu54iq0cBenw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504112;
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
	bh=0OSVyRMwkTFhe/VYzUqR8sfmJ7deCG6+6TxSKqSqZKE=;
	b=1n+i5/+ELd+FdpspjpVqbkhVFQ6bne01xbAH/Ap2gbD/Kz5tVngeIpOHe+RwT5PSGCUA
	 LuTZ0867bLp8EWgF8EkySuBTIGY89eHI88VtzPqSZKWyKzb/neBeMgWQTi+H0gFZ55Vtv
	 +QkU0jzYlV/oE62SnxLhVWVR6KUmNqiLHGbSijer8x8VjHU6ns8joH7U57p18exrthKXB
	 zzB1FB6dv3fUQmoDdcnVgsvaoHGOlrT+T96a8l6YRKE+Lnu+kGHtmGG22VJD5T33IAofg
	 7nYJYdN9Oe0pWyWm8L3v6o1aM6drHJJcFOj7ZRRIKNB93Q+5bWE4GyF3GQRhv16VXxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=jJOiJ8Ag;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.9
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3DB606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3DB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=jJOiJ8Ag
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRgl82iOyLdvDJ/v7UI2KpGQWPSuAMHNJRY7t3PqbyEweGWqLpicm1EW6xoo4XaROWzlszYdsLk4nPog7b0ixxYDZeDsmR93R2pejUsXAv4k5zHySxP5gLEyKbcGcZQOZbQ5DvFYhJw5W2FNnbR8wK1zMqf6GskI2qAT2NzUUrI0h0NttpCdkXwLSNve4f/G7fj1pzYKo2gA2rgjjcg9ChAhF7mN1tWXKy/CdEsEPxmVU9wM8yY4v9uwQexnrUuArRSOwCES3xsdsv0ZZ9T/ITCoVlksTWn05VxZbEUe3d16lchPsZwZYTbK0I1HrEnsbk1pch/6E6E+x5s6m66Wjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OSVyRMwkTFhe/VYzUqR8sfmJ7deCG6+6TxSKqSqZKE=;
 b=grHRmGrDk7TV0ct4lUxSSPUWcIsGx5cKHNBtr9Oy5KqXGyB1QeZPMU10/TR+ZBXAbG4fsi3fOBipmEmmzeZQRxePtdmc+ZEInB9ILwCKgXmT01roSQEHp2eKv1ArDgll+Dd2pobz2G41/5A8w8yaVDmrS9ZBospykTmZLO7vtcQa5QSAPtUlzSONbnSNbK6d0ND1rJqJ2uXq035uR/lGNGLBE18mcaW4MhtYevc6wRuCaDlOLVrx+q1ylVTE+ZbEtzM8Jk/Jf60QMzWBXk41I4zIUUFZEpImuSF8Ct5L87d2Aj8UK0uAayEm/yulIBzrkvCrXp2cAkJRbE01/C4CSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OSVyRMwkTFhe/VYzUqR8sfmJ7deCG6+6TxSKqSqZKE=;
 b=jJOiJ8AgeCxuvXg3IoWmsk0sHc0hTLDZK4/gaypUIH0AjZWs4QpKg8uFGZ9m31hP6GC6BRqToMTd0dM3poT8g+deK9VVUfML3e/SMNE9ZzzDBrUcZHdT8RwwTwHRxiOdFwA/dGPrByx0JxH/itWA9ZO8yhZdU0SwO6aa5nemeVY=
Received: from AS4P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::12)
 by PA3PR10MB9270.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Thu, 12 Nov
 2026 17:21:47 +0000
Received: from ZR1PEPF0000E45D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::78) by AS4P189CA0011.outlook.office365.com
 (2603:10a6:20b:5d7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 17:21:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 ZR1PEPF0000E45D.mail.protection.outlook.com (10.167.241.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 17:21:47 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id RSAFxg00mf0UDRYUcxcAyJ; Thu, 12 Nov 2026 18:21:46 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id RYUcxKA00btn9RYUcxVmEd; Thu, 12 Nov 2026 18:21:46 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 87F1B180398;
	Thu, 12 Nov 2026 18:21:46 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id 82697FE023B; Thu, 12 Nov 2026 18:21:46 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: linux-wireless@vger.kernel.org
Cc: jeff.chen_1@nxp.com,
	francesco@dolcini.it,
	johannes@sipsolutions.net,
	lilinmao@kylinos.cn,
	kees+treewide@kernel.org,
	elb12345@hotmail.co.uk,
	linux-kernel@vger.kernel.org,
	Vishal Gupta <vishal.gupta_1@philips.com>
Subject: [PATCH 1/1] wifi: nxpwifi: fix race on scan_processing in nxpwifi_scan_networks()
Date: Thu, 12 Nov 2026 18:21:44 +0100
Message-ID: <20261112172144.360189-1-vishal.gupta_1@philips.com>
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
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E45D:EE_|PA3PR10MB9270:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9f261b06-62cd-4e3b-bda7-08df40e16e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|11063799006|261021123027099003|56012099006|261026140227099003|261026121527099003|261022075727099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|5023799004|261028144727099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eyDOMjwhH4rWEsWPXJQz7R/vLPCsljVLWDq6mB9jgFOF0A0TlAiIsdQM4nghNKndYVU73clLDBbPht8l6o2ytEcJgY62TG5AKAYSgHRkkqc2o1ysu3hCN20tBRNga+c+8gGcNSDNI+0aR4rPzDpFTafOG1oMsqFcuCberra+djxCl6IYZwl0Jd6o16MO82Iovo6wuEvKR0Zaq8jRShmY1IToH+CbHFZRMZI2I1WOLHEU1ZTW1ENPuChokFuA5nIzhsYKQf+5fKzrPJ7pvvMZlzr1Pt17plK9Jn2FucZORn+cVZ8j+DLN5rWK6L8/m2fcKMtjQwqDthk5r9Otf4Kj9UupAIpygt9Qc2UB9Fl+pkyYoR6jt5QSYaL5iQR8zjhmbz8xDIO9TDiLGZy+wKbdTv4BxPZnVhOZTvPpW33E7SyhgqnuDg6509poSnJkULXdGpnwf1MYO/tWesv/BUwUmaEmeXZft/vtdNgLiB8UBR+j+nN/fXSAG/6b7gZlWbSYWUnnUgMpnpZ54FxbGjNoHjYZOzZ/p02i33ogTpqhq2THMo2CeNay9FxeT40dfuhSQl+0Zvf6g4o8LSVjJj0sjrGxgPr1UsQ+M4n4Ye/BUIM1Is0cSkuYbQebIN8FTbf0uYdsZoU9o5jF+ftBNK/QgoJ422zgmZ8AKkztYHVfKETEl23bctYat9YE1A2aMoafhrTYw8dBS2OQr6Zughou0Q==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(11063799006)(261021123027099003)(56012099006)(261026140227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(5023799004)(261028144727099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Oz9nrNyqB9v+OSYECWooGZ2umng7J+1TvxJsZM9LFbLezrhrJ9AJvBqYQzd0Uwd5ipc7r1CBwWYEz7d52o7b9isuul0z6b7XT9seNTbuTas8fNu9X8e00DmhcqaYzwfHUyJIFvcfSuPkCKW5llTzHE38Fa2ghonwoK1+GqRS8BJkLUtnoZUOC4PyYTZKhT1Im5U6Z0uLTZwDAwiM1dyIKChsS/7awdr0dxAobDw1NPcAYXS7E8XT4GcAJUUJzDaAMxS8sAnbMaJzWB8cYtv2gAysCT3HMsQQy1I+5E0DYffYg3mNoW+5Etcp6QaTjDKZGd4Qq84t2wnJ6eNL63QKm7HnuIc2TcesoI1p+pVDPqvJ+a3p0uhCgmZX1TVu40IoHYp7aPHEJVs6/KWUrv08S/cQLm1JTRaZCzvwFXmuAP04qsP2CW/rmJJ1PQ5rJOmH
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 17:21:47.0235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f261b06-62cd-4e3b-bda7-08df40e16e3a
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E45D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9270

nxpwifi_scan_networks() tests adapter->scan_processing without holding
any lock and only sets it later under nxpwifi_cmd_lock. The test and the
set are not atomic, so two callers can both observe the flag clear and
both start a scan.

This is reachable because the function has two callers in different
contexts: nxpwifi_cfg80211_scan() runs under the wiphy mutex, while
nxpwifi_active_scan_req_for_passive_chan() runs from the driver's main
work via nxpwifi_check_next_scan_command(), which is not serialized
against cfg80211 ops.

After the last scan command completes, nxpwifi_check_next_scan_command()
clears scan_processing and then starts the follow-up hidden SSID scan;
a scan request from user space arriving in that window passes the unlocked
check as well. Both scans then queue commands on scan_pending_q and share
priv->scan_request, so one can clear scan_processing or call
cfg80211_scan_done() while the other is still running.

Move the scan_processing check under nxpwifi_cmd_lock, in the same
critical section that sets it, so that test and set are atomic.

Signed-off-by: Vishal Gupta <vishal.gupta_1@philips.com>
---
 drivers/net/wireless/nxp/nxpwifi/scan.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/scan.c b/drivers/net/wireless/nxp/nxpwifi/scan.c
index f3becafb9c23c..548c257a2e3c3 100644
--- a/drivers/net/wireless/nxp/nxpwifi/scan.c
+++ b/drivers/net/wireless/nxp/nxpwifi/scan.c
@@ -1336,12 +1336,6 @@ int nxpwifi_scan_networks(struct nxpwifi_private *priv,
 	u8 scan_current_chan_only;
 	u8 max_chan_per_scan;
 
-	if (adapter->scan_processing) {
-		nxpwifi_dbg(adapter, WARN,
-			    "cmd: Scan already in process...\n");
-		return -EBUSY;
-	}
-
 	if (priv->scan_block) {
 		nxpwifi_dbg(adapter, WARN,
 			    "cmd: Scan is blocked during association...\n");
@@ -1356,6 +1350,12 @@ int nxpwifi_scan_networks(struct nxpwifi_private *priv,
 	}
 
 	spin_lock_bh(&adapter->nxpwifi_cmd_lock);
+	if (adapter->scan_processing) {
+		spin_unlock_bh(&adapter->nxpwifi_cmd_lock);
+		nxpwifi_dbg(adapter, WARN,
+			    "cmd: Scan already in process...\n");
+		return -EBUSY;
+	}
 	adapter->scan_processing = true;
 	spin_unlock_bh(&adapter->nxpwifi_cmd_lock);
 
-- 
2.43.0

