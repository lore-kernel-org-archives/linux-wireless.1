Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795682041;
	b=x1F4iAYdPtwfziDjn9uvfDsXISEKPcDBFk/ARF3/PdISImI+fSnzNrpmujkb739aFxL5
	 nzPrYRCk/ZPUw3flZShrBG1q1VntST6JSGm7TVyPEMFzKi8+laGNMbFg8/LeKeRZNLcvg
	 KUF8qA/gujJF17g3j4GGq6cBkIo+fv38vLOGIsDoWzC+0L2EDOnJ3Iqk4xB5RBxuD41gT
	 3vZwHPFur3AjpOUd/o9UzYOwtFTajzY3KnAZTs1xi4O0+ZSuzXVfPW4WYz4nlvu33KlP/
	 jBHHcUoSJzg/NrJW4vc6WjO2rPN+Oh98MaowWqYFQzG9kVgCtCypz0BC1ywqpL4zbpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682041;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=pNBL3P/+inYfgJZvhOShryqL1GH9tWM7hk/gc88KJvU=;
	b=0L6oG+9d7lORpVsGVJTRqYQADpAzVmpYEKyPqG+er7w6/SycwWrpGqxIa0B5P7IYbimV
	 Bc77NkxgA5pvuzaDRLjxHzdJyxz71UfAmoYogzjSQ1gA3MoRmSSsU7CKVbRymJif85Y9H
	 jpbpSACSK5Hrgo7Th5KIcaNzEhLq8+IEohmQdZvR2PJJAKeBM6zzGiR3P/IANV9LmQHXW
	 ZNomZ+2WkygFieYbhYJRtJEu6mUNLIWgkVKf9xgmeTUYgkzu+3Q3z7gEG0kfqdrf3PWZc
	 CWsrJTaNoT06LPHc69tC9fZZ0u1pu21f/EP5wD+yFvQbx/YhqaU10pTw4Jzu+meaSBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=LKdtJTqJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E875606A326;
	Thu, 26 Nov 2026 08:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E875606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=LKdtJTqJ
ARC-Seal: i=1; a=rsa-sha256; t=1795681940; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=epiFBxFEaGlDz5SbwPZR7exWMtQgTPR6iU7SpILrXW78z91kT2R4amns3/AfdoUSffZGPLnC1Q0YFq/srsO8oYX3eihUlGcxEKzBPOFUpyXL37G3YXiXf3ikhGc5u0Fej5vt1kGf9+V6K2vKKzJ0lkHZlgOweponU9xVpRZ5veo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795681940; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pNBL3P/+inYfgJZvhOShryqL1GH9tWM7hk/gc88KJvU=; 
	b=iP9ZAoxYmnOnscJbY0CSvUZ0lCiN4LXfT9R9NB09YF4nO8BNeKpjQjE5OKZgLvFLi4E1973krunyBEac6NZZj0DQWFY0qI4rjdc9k1n2iRx99ykt2jdogijLAIHdCN7Sm909Mo+4I3qjZqjQmnR2LG0NbjSHLgjrvBvkoCsDTUY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=LKdtJTqJTYk4Zit5VPcdQ0enGQwlGHeMB3m8VnMwpO68JvhsTKD5+EdsDEPdwb2yF1LAZAJ+AzVgELLikZKA2aumQZBXITrQKDgRWoTBMEVHK4X3KlWKy9JyoxDuRKxTdFXmmZjPxV5C0ok+NMVc87S5T8ma6qq56nlQ0m+94kL0iw7XN4XdfAqBPEDqKlj1TkRCbKfU/e90jmV++S4f6yYTI2hlqRADN+amH3/jlyMNUETVJJ9DlptHK5uFhQ7yEMjn8++AWOvkMpA21PVYEBty+zj2fuW6KQiNhNGblIGEqBYCseC4CiaON/XrSkKiYubENN9xoqTzqxfRk1FRsw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=pNBL3P/+inYfgJZvhOShryqL1GH9tWM7hk/gc88KJvU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795681938821740.2867409957028;
	Thu, 26 Nov 2026 00:32:18 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ahmet Zeren <niko3x@proton.me>,
	Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next 2/2] wifi: rtw89: pci: fix TX status and counters for NO_ACK frames
Date: Thu, 26 Nov 2026 13:31:41 +0500
Message-ID: <20261126083141.1470-3-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261126083141.1470-1-owner@ph4ntom-rev.uz>
References: <20261126083141.1470-1-owner@ph4ntom-rev.uz>
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

In rtw89_pci_tx_status(), IEEE80211_TX_STAT_NOACK_TRANSMITTED is set
unconditionally whenever IEEE80211_TX_CTL_NO_ACK is present, even when
the frame was dropped (RTW89_TX_MACID_DROP or RTW89_TX_LIFE_TIME)
without being transmitted. In addition, when a NO_ACK frame completes
with RTW89_TX_DONE (broadcast, QoS No-Ack, or Wi-Fi 7 BE NO_ACK), the
subsequent RTW89_TX_DONE branch also sets IEEE80211_TX_STAT_ACK and
increments tx_ring->tx_acked, whereas unacknowledged Wi-Fi 6 AX unicast
NO_ACK frames (tx_cnt_lmt = 1) complete with RTW89_TX_RETRY_LIMIT and
fall into the failure path.

Clear stale TX status bits and set IEEE80211_TX_STAT_NOACK_TRANSMITTED
exclusively when a NO_ACK frame completes with RTW89_TX_DONE or
RTW89_TX_RETRY_LIMIT, reserving IEEE80211_TX_STAT_ACK and
tx_ring->tx_acked for non-NO_ACK completions while still accounting
RTW89_TX_LIFE_TIME and RTW89_TX_MACID_DROP as failures.

Fixes: e3ec7017f6a2 ("rtw89: add Realtek 802.11ax driver")
Cc: stable@vger.kernel.org
Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/pci.c b/drivers/net/wireless/realtek/rtw89/pci.c
index 76523d057..2204ed8c5 100644
--- a/drivers/net/wireless/realtek/rtw89/pci.c
+++ b/drivers/net/wireless/realtek/rtw89/pci.c
@@ -470,9 +470,12 @@ static void rtw89_pci_tx_status(struct rtw89_dev *rtwdev,
 	info = IEEE80211_SKB_CB(skb);
 	ieee80211_tx_info_clear_status(info);
 
-	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
+	info->flags &= ~(IEEE80211_TX_STAT_NOACK_TRANSMITTED |
+			 IEEE80211_TX_STAT_ACK);
+	if ((info->flags & IEEE80211_TX_CTL_NO_ACK) &&
+	    (tx_status == RTW89_TX_DONE || tx_status == RTW89_TX_RETRY_LIMIT)) {
 		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
-	if (tx_status == RTW89_TX_DONE) {
+	} else if (tx_status == RTW89_TX_DONE) {
 		info->flags |= IEEE80211_TX_STAT_ACK;
 		tx_ring->tx_acked++;
 	} else {
-- 
2.53.0

