Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866657;
	b=Ick/q8AuV/QSUUBpT7CuWDDn8dxj3vTq96y/czQRXHCXtosBqa1fC7jyYt1A2Y84/kxo
	 s4oyQly7hUsM8gpCzpT4m5RMIsBK5Kjpbecpj8pibB/ee0skMYO8p8m3hh+X9hnmU7+13
	 5ekGiMAjLwK9qSDBgVJIodSosuQiwM9Wnex8oo1EFYEEhIlAsBoubcBLaRGGxMAIfyrqd
	 ufKUSTk51tanQj8M5rX0HyxXyPqxdZwc617xtas82ii9an3GMMiUZc04FyR7sd1hOksZQ
	 otiYNzpT8+KomWyGvS0AAPwBTIuKHBQOA0sNwTXGNooh8UYPb7B9WTy9t6sLFfre5hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=;
	b=DWL/+8g0cfky6+akYXuiqquy6++mz45BX0vRMC4gMbzh6cn8RzLwSSdSl6kLEQLjMqcx
	 wfBq+tbnCT8do+lcBkrOqtQMZMCDNv/CZfeyY9q/nR0kayrMuwSwQMzXHQu5mNdDaA/so
	 JJdrbVDHKX2wpqwAajfLTpPOle7tRwlGEv45L9s6W+ipp9ncBtntOCIg0wXNqLRytXa6i
	 gQ8YrwVZCMC9zWp2s+Gy1kl+w+iAgtIAX9M81B68CEqiv/tb86iVz9zyKxxafuzRP37eK
	 GnjkzdFSE6ascCUUNQLW9UMKdZHw7MbnFX+ZnRgUKAklV4PsZiOemax5AZS+GBBcbaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rioHM3Sw;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEA9606A31F
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 11:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AEA9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rioHM3Sw
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so7591562f8f.1
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 03:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866655; x=1796471455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=;
        b=rioHM3SwpsVmglOILidKE8szcWuHURkEJkwLd3rft+M/+KgV5oZLggNHOPBL0EYKXr
         CdPcgn4+gMb2tyaBxUe+tvHR21lcrKV41DJzZHQuu1g6I9cDgbi/noZp8yfQI0ou0hH/
         r7LC3HlNZNsHZ9D/PVMKBP8i5/WQdHuU+rJMZ/D+gUqdSMC07wNoxOgoo6TBaQDTIPL0
         bsLoWChcqlelLlIjOeH7w9CXdAwpvbYcEyrRUY5df6xlREkHx1Hy77CVRCb2Sd2axagl
         BJDLZN6DNgLGoxNcEU1LBpzMuTMC+EG+EIq7aQg02lWXLstzc21EqANQv7ueQrtEbf6B
         3P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866655; x=1796471455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=;
        b=tfI96OUMG7cS3Su4PNV6Fsj43tyUzBXPeX1GWlN6G+geXy8eqZiYJ+gmAepnaybnal
         80ISdMg8iWZb/Nk4JyZtl6FAF3ubDsDR0NBjEhL1zq7nsUT1sR5RJWitOmlEAu6E2/kD
         ROgIStdlwaXkOc5bba39Grd1MYQUVCmVuGW1dh0Nih2PT5kv1lTK8h0cEvTqWOq3DerV
         YLhIooPqlYjd2Zy615mcgLfH2KuI8Np/9VtZWt5Jc3VNH+IMFXEUC+4jNQ8EmvKi4I/b
         mjT2vrlgdln0hyb+5tX4pYBnefnnqnOZc19X7vu9RD441w232TcxCHwmgs7aHU4Q3KIX
         0f2g==
X-Gm-Message-State: APuU4Z97YTA+H6E6Dx/yc0B7PTiKav8HBQgRnM4Rza+SmZiO93D2JR7Y
	aa/g5EPimJm9W+27lIkMh3EsF1nP8uDRB8Z2tx1AXuDv8gErHMB84TH7r7+WQBaDN3251w==
X-Gm-Gg: AZFdTZfAKu5iLF+YCTvl1nQlZ9r+ge46OOAEZe524U2qQGWfSQjiCuttVbI9rk4jppW
	AmTt9dvgqTOhz9MrcAoUVhZep5tCChGq0iJeABNu7b0gWbvmClSVoL84E6wM/iS2bT/7UZVioak
	OSAoXP7yIl+DtSIzsnA496mV3ha3pj3/ER7tVJd2KwQyRyAMLrLy+mvottGoFRfro8fOuVpzoZy
	qTCJ1Kb2YXfFxn203RsUKNw/RlonG7qtev4dcvNg4Yo8pmCDKjQ08QG3dx7An26bfD9ZSRjsUcJ
	rxd9Y2IzIgtwR3A41jByNoffOjAAcaFOXgRNBVZlgGZamPo3OyQHySyaWK4z/mGWNx6UHn08mu1
	sUjBs/RdIpwn0ukpgyVVpeKODCus3ZkPHZnWL4Et6AumJguZnyDEtrMUPixXEnDxYYsYAcCIjng
	IeFNc8ohhz1SLUECAGLoWa4WWLHS36ESsi7NwrivQsTpO58WnnmU5pUAPmmKBePYxrNg7IajBuS
	i7kq+Zur+H2pNOHUmMvPm6bFS3Nyn3wWoHjPG2xMmox/tgqC+5HxacYYk61bY8mlGfa7ee3Og1I
	qTSlvS+mvKsuWz7C5pkjKZHj1uy93d6NqBr69JE=
X-Received: by 2002:a05:6000:470c:b0:4a7:557:fc0 with SMTP id ffacd0b85a97d-4abb225fb4bmr52266863f8f.32.1795866654635;
        Sat, 28 Nov 2026 03:50:54 -0800 (PST)
Received: from DebianTestingKDE-VM ([213.16.57.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm51953284f8f.37.2026.11.28.03.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:50:54 -0800 (PST)
From: Valentin Berezhnoy <dreyksmail@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Valentin Berezhnoy <dreyksmail@gmail.com>
Subject: [PATCH mt76] wifi: mt76: reorder RX frames when WED does not handle RX
Date: Sat, 28 Nov 2026 13:50:48 +0200
Message-ID: <20261128115048.84165-1-dreyksmail@gmail.com>
X-Mailer: git-send-email 2.53.0
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

mt76_rx_poll_complete() skips mt76_rx_aggr_reorder() whenever
mtk_wed_device_active() is true. MT7622 WED v1 offloads TX only:
mtk_wed_get_rx_capa() is false, the RX rings stay with the host and
mt7915 does not set up WED RX offload. So on MT7622 + MT7915 with
mt7915e wed_enable=1, nothing reorders the frames of an RX Block Ack
session.

Out-of-order frames then reach mt76_check_ccmp_pn() first, and those
with a lower packet number are marked as replays. Since commit
1c5ed3eb68a9 ("wifi: mt76: free a replayed 802.3 frame with all
its subframes") drops such 802.3 frames, 5 GHz uploads from a client
fell from 814-840 Mbit/s to 378-593 Mbit/s, with 5031-7630 TCP
retransmissions per run instead of 583-822. Debug counters marked
2171 single and 5661 A-MSDU 802.3 frames out of 228603.

Check mtk_wed_get_rx_capa() as well before bypassing the reordering.
The bypass stays where WED handles RX (MT7986 WED v2 with WO,
MT7988/MT7996 WED v3 with HWRRO), and the NPU path is unchanged. With
this change, at most 16 single and no A-MSDU frames out of 757567
were marked, as with WED detached, and uploads reached 826-859 Mbit/s
with 66-157 retransmissions per run.

Fixes: 4f831d18d12d ("wifi: mt76: mt7915: enable WED RX support")
Assisted-by: LLM
Signed-off-by: Valentin Berezhnoy <dreyksmail@gmail.com>
---
Measured on an MT7622 + MT7915 router with OpenWrt 25.12.

This patch was prepared with the help of an AI assistant and reviewed
by the submitter.

 drivers/net/wireless/mediatek/mt76/mac80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 33f2bd5..4e56de3 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1751,7 +1751,8 @@ void mt76_rx_poll_complete(struct mt76_dev *dev, enum mt76_rxq_id q,
 
 	while ((skb = __skb_dequeue(&dev->rx_skb[q])) != NULL) {
 		mt76_check_sta(dev, skb);
-		if (mtk_wed_device_active(&dev->mmio.wed) ||
+		if ((mtk_wed_device_active(&dev->mmio.wed) &&
+		     mtk_wed_get_rx_capa(&dev->mmio.wed)) ||
 		    mt76_npu_device_active(dev))
 			__skb_queue_tail(&frames, skb);
 		else
-- 
2.53.0

