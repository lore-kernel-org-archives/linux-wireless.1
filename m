Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774590;
	b=KUcMF7tuJ+SFc71qrTr7k2V0aGU58X4VAhPysTjKSuI34Qq72yij9WXbVqrZjvxKI09+
	 yvenHZyk4fNjr379UYI7iQKKdDWsdldn2EXTd46HZJDVdT6BrgJ74y3jEro8xYIgp+MMw
	 0uOBdmbGDuilWokRxX8OAMfvHRb5Ht+z7D4Igaa4u88KsXKxPLml5lBhc3/grSUH/nUqU
	 lbeL79i2GoZRiqQWbSVN4JbeoR55Tzk6p8PNpcO0/Yzr/dZACY2/RcMT0IBKyrnVAHyu8
	 bDJ9OaVXuEDZ6flVrE5zEGpv5+4Dt6Rb7WrDnjtjMacJysaj+ujtxcdbRyisGQsqhHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774590;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=tKpJqEX3AfZic/bNsbfNhxGYSnco/Htsga45SGuxJRk=;
	b=w9I4SJLUqHyIhI13oW6llEBiEgAykqFIYwyU1sxul8fDAi51lViVJXlIfRcYAulELyki
	 o+4s9QqtDxa7ReWds9dlyExAVmiwPOdgavfHkJleYehvWQ62/d44dXwG4Eg/z+fCfchef
	 qn2EQibWWDcaGc930khZwLs/C6mjgqMOmyXIPmmrAcply3Phnj1I1+OD/k5Q0Sdk7iT89
	 aWMW5q5zgA/jWEVWQeEfELimSTVicisUhw+iybhKD0OEoVjSVQtJC1V2Sirnc2IDP8xvY
	 ovRDne3BuyxcHk97w3tqueIghWaK5RbOLIBylXb4Isn8Fvld9FynrpvtsSoND8QQolw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=daHvAZzC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47029606A31E;
	Fri, 27 Nov 2026 10:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47029606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=daHvAZzC
ARC-Seal: i=1; a=rsa-sha256; t=1795774400; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n2Fj/gaHsL4q0AMekRtgzCiCkY9XvXMeXuNDeaVJF2jeHPBLjHh38LPjX69YKCa6yu0HPtLByedKESOOWy69qkKVckJiZpiWOa/JsxwKB7U6nxV5sLpn3EuJAt2ZOvvdl4IUWo3wf5wnxkELKZo+jV0n6rx7naqnNbxy+NRLT3g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795774400; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tKpJqEX3AfZic/bNsbfNhxGYSnco/Htsga45SGuxJRk=; 
	b=AZKP2Jqp6/qv5L+qKwRFlar02WSFb19w5nhJi0Y6dkJiUtjzXykdMzI2sosPL9ZC20ygtXnuLYaCVEMhCsk1MBE1GdP6LzlgeQQXR389FsR7mhgxEFukh5Bl7oxG6dMJcpNNAkgDC4V3VUXOJu2+0Ji9tDRWPqxzMqsj3frZsYc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=daHvAZzC2A5sv2SHH3rnt9zGPuVPYc1bFLFSxZhJSmj3Kkv7fTK0pgrC8QjJr2oLfptytyWGa7fpTxNRjFwJ00QANIiDftiIX2W37+fRJ2ZtGpXHKZDkzBG2hUFVYmG+dJXMbAXDIOzGaYeULwl/eHfEaQL7SDWKZIRJpnqPT3Tqwug/fBwBhtY88ru9n7IuWBr6NXut3NCa6PIU/SIWBoYEAD1a/4pf8/6e8TUlyo/CZoCaSBfQmHjFJyVOeLG+tmp+JCL9GUC55JHXZb6Be+2BDA8SKaWyqJvU/uhiJaih766LaM6UOkmLRa+d/W63udnwWhtcaN/X/BzFj8Hv3g==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=tKpJqEX3AfZic/bNsbfNhxGYSnco/Htsga45SGuxJRk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795774398672690.6037288918507;
	Fri, 27 Nov 2026 02:13:18 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ahmet Zeren <niko3x@proton.me>,
	Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v2 2/2] wifi: rtw89: pci: fix NO_ACK TX status reporting
Date: Fri, 27 Nov 2026 15:13:07 +0500
Message-ID: <20261127101307.15-3-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261127101307.15-1-owner@ph4ntom-rev.uz>
References: <20261127101307.15-1-owner@ph4ntom-rev.uz>
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
X-ZohoMailClient: External

PCIe devices report TX status via rtw89_pci_tx_status() rather than
rtw89_tx_rpt_tx_status(). Currently it sets
IEEE80211_TX_STAT_NOACK_TRANSMITTED even when a NO_ACK skb was dropped
(MACID_DROP or LIFE_TIME), so mac80211 counts dropped frames as sent,
and it also sets IEEE80211_TX_STAT_ACK on RTW89_TX_DONE.

Only set NOACK_TRANSMITTED on RTW89_TX_DONE or RTW89_TX_RETRY_LIMIT,
skip the TX failure debug log in that case, and do not set
IEEE80211_TX_STAT_ACK for NO_ACK frames.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/pci.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/pci.c b/drivers/net/wireless/realtek/rtw89/pci.c
index 76523d0578..2b6a5e2222 100644
--- a/drivers/net/wireless/realtek/rtw89/pci.c
+++ b/drivers/net/wireless/realtek/rtw89/pci.c
@@ -470,13 +470,17 @@ static void rtw89_pci_tx_status(struct rtw89_dev *rtwdev,
 	info = IEEE80211_SKB_CB(skb);
 	ieee80211_tx_info_clear_status(info);
 
-	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
-		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
 	if (tx_status == RTW89_TX_DONE) {
-		info->flags |= IEEE80211_TX_STAT_ACK;
+		if (info->flags & IEEE80211_TX_CTL_NO_ACK)
+			info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
+		else
+			info->flags |= IEEE80211_TX_STAT_ACK;
 		tx_ring->tx_acked++;
 	} else {
-		if (info->flags & IEEE80211_TX_CTL_REQ_TX_STATUS)
+		if (info->flags & IEEE80211_TX_CTL_NO_ACK &&
+		    tx_status == RTW89_TX_RETRY_LIMIT)
+			info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
+		else if (info->flags & IEEE80211_TX_CTL_REQ_TX_STATUS)
 			rtw89_debug(rtwdev, RTW89_DBG_FW,
 				    "failed to TX of status %x\n", tx_status);
 		switch (tx_status) {
-- 
2.53.0

