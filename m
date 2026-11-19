Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795075558;
	b=RDhR7AXLXp6hnORiCf7AmRiBYo/Bn5okMpfJgzBoyxOY8/kmz/4SnloLfvQgJRYI8oMz
	 XeQFJQpBjoOucB3DO+p0PxjBZ6q9M4wq4qoViRbigOc9d8v23HS7Iu8W1Nc1OiHF9GGlM
	 k07Ft9giaHPogq3UbhaLiUgX0Bg0j5g5fBcO5mYXJ1VBFun2THEUfreYhL4TLkk87YZmF
	 yor/NNwc2AVTcNmbjTlNavyLIwysU07lWKhv4KcLay5yx8dBoFgtiup6kBsVBWb8vb6dv
	 5nMIqllM/Bb2w9LojUxhw2MGUC3BespAyxAM10QBNif5XaB+KZOZApseLGHHjonBvOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075558;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=NHI6BW9pLQjmIbjPaOYgJWZ73j9cNWl2BkFxY+3OaCQ=;
	b=V2421tybIbRILgJQ4kt7D/fgxq+3tukmy4LbF5l00aDAJHeJPQdTFiX1mlSlXfVDoY1v
	 QYxPDxOsMxHub8N5siCfkIzyIonWbFfLQ5S1izi7Q32JG54royTbPWrEGJhWYdm/8cEcu
	 MA2Fe4WAO1+k5hikrOZecRtOMGjK6/3MeyJxZoqTV35VE0T2tmLc5zbqW9poI9aPL2qZT
	 FrXYLQTC2s1TszyTHwghzFnlEwD26CCW59saw/lhr21mVE/klhxTD6emcktq6BPcma0ie
	 9iTBXt/q+CDHAeGAgUC7rZ0MxF6qJwMP2M9ZeLN8xiaW7p9iXKJdaiUpGwREZRe/OFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=qOd4POUD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BFD606A320;
	Thu, 19 Nov 2026 08:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4BFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=qOd4POUD
ARC-Seal: i=1; a=rsa-sha256; t=1795075422; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bOPFClreNwlIy5NoeMjbUFuHQuKe/hYeCI9eajxZNPAGbPfvbrLRZCTrfcoufX1JstlMNEML5u2fkzGmcDvp3Z6Elrvs2GvA8vOS392K1SxmtWCfHf4OqFjfVSasrU2OmZbcnl0tna97NN/6bnIBLy+1o7CVVgLsOZ0TQgrrj9c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795075422; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NHI6BW9pLQjmIbjPaOYgJWZ73j9cNWl2BkFxY+3OaCQ=; 
	b=cINOCJtXbT26bSwi+1vnU1S05cjHLj0YOHsFdzSy4olkFOiBP0mQcBs7zg0WFOsyJXF3vQVuQvHCmHxfm2t31tWLIlR9IpOxqJjukSZFx2VPkaDwfush5PN3e3feEZNeDpYqoD3Bpg6GL7v14o4oMzckamLnGw5SlpFgRadzG5s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=qOd4POUDDS87H5DQyKQ+7DRAm2YVyNtZ0nLQQDf70i9R14TzF+FGzAydxFPPIAZsDhxTRS6fvTghYse0ZqHdC2b70VAxU7S20mnvoSvX9KmxmhC67/7DUE0+xYTqkZbnw3qPXAleK4UO6A7b+n49nJvnRCXmD0kjVzc2sy2522RHDIkJYmeFs1XfY34UzaJS+/eye4lpoQSrJzqsRWDPaU98K/c/Tv5C9B46eS59awApJBW3cSIpXDembgl7vsAofBPFCP4IBgHlDAyqiUHTvXLEU5u8pWzIUFuLwO1hSWff2F0LjxASTfCUwhRbVy7nEeN+aiMoawml0WpLIOT5tQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=NHI6BW9pLQjmIbjPaOYgJWZ73j9cNWl2BkFxY+3OaCQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795075421223114.53471319954656;
	Thu, 19 Nov 2026 00:03:41 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v8 4/5] wifi: rtw89: avoid reading seq_ctrl on control frames
Date: Thu, 19 Nov 2026 13:03:27 +0500
Message-ID: <20261119080328.391-5-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261119080328.391-1-owner@ph4ntom-rev.uz>
References: <20261119080328.391-1-owner@ph4ntom-rev.uz>
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

Injected 802.11 control frames such as 10-byte ACK/CTS or 16-byte RTS
do not carry a sequence control field and are shorter than a 24-byte
3-address header.

Set seq to 0 for control frames instead of reading hdr->seq_ctrl.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 8333b26..3d1fed6 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1317,7 +1317,11 @@ rtw89_core_tx_update_desc_info(struct rtw89_dev *rtwdev,
 	else if (tx_req->vif)
 		desc_info->mlo = ieee80211_vif_is_mld(tx_req->vif);
 
-	seq = (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
+	if (ieee80211_is_ctl(hdr->frame_control))
+		seq = 0;
+	else
+		seq = (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
+
 	addr_cam = rtw89_get_addr_cam_of(tx_req->rtwvif_link,
 					 tx_req->rtwsta_link);
 	if (addr_cam->valid && desc_info->mlo)
-- 
2.56.0.windows.4

