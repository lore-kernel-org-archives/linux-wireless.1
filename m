Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441765;
	b=FfCQ2ofK8IuAYeAWByb/qbYP4UeNjsrNSUwbcRX63iClEvdQ/Kxh/VRGPJQVdiegS3xu
	 Yk2W/g+QGEK+2P+VHoz1aVV4vYWQMkx5KxqIB/gHqNQUYarg8xjS0mTSdjZYHv8qkAPQp
	 b648Y+ZnVJ/MMZYRf8a70Tabtcz2anPr+W502epYHIFhOqSu5ANCeKTOFD5c7FbdgmLzP
	 6JcEmJDZ+a2HdGObVS3gNb86rVzMculW2Kaxve2nTYiHc30iL0KdL0CSTfcXshAqdDDCZ
	 ZwQhkg6QtsMwi7I8C440uyT3JmBD87VWJR6fzdX2iJAIe42NsoWSezwkpEqo5L26bug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441765;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=suHtxHMq6K6TjbxLW/GXqyPwfRxCY8nZR/DAJH6KAGw=;
	b=NfhoRyxDvPN8s3/KOLhI+sUzsuKyjMpDgKdpvPaplGzQsUopHdGHHIixCMVeYMqpUNp0
	 ndGN/PJPX31tHbgZ1B0SjAar5MUVcgaqdNkz6j29j/nBVGXGOagd1emjEmPUAv/EuBWsZ
	 drBWtiKFOP88C+snumIJpT7anfn3ACxaMZGcSIuIbBnQZ4qlOPoFLbFPDxznLGCFv6QQn
	 X/bsl5msmzHHz1RT07shwDxQmrQXa8vdnotV5RaXwPjKNQgHjx5l63O4ovyGPKhtx2Sva
	 0qs4sUWU0pNZkpVRWvMQ6p3Zi2esfFssEAvTaaqhaI+zCLwAdMBoJS+6EbjB6RVXTVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=jpFdNDOj;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAA5606A327
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBAA5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=jpFdNDOj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=suHtxHMq6K6TjbxLW/GXqyPwfRxCY8nZR/DAJH6KAGw=; b=jpFdNDOj/8gF2IVSl/WG5M+9eh
	KIC02OmF7Z3pnnjRDA5+jQ6gmWdRdH1JLyAlvgdSiP0k6OASZRcUQMaonAVCyBV0hS5ulHe3Xp0/1
	SSYM9fi0g78vd8vOgvn8BEEVB6ZYk0lDQKEeGGUG1tSNejtTIgYYHKN7ujg2PhTFIIbg=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ6-007NFk-08
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:22 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 02/20] wifi: mt76: mt7925: keep the embedded link's BMC wcid after a failed add
Date: Mon, 23 Nov 2026 14:49:01 +0100
Message-ID: <20261123134920.154270-2-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

When DEV_INFO fails for the embedded link in mt7925_change_vif_links(),
mt7925_mac_link_bss_add() keeps the BSS of that link but frees its BMC
wcid. The next association of a P2P client must allocate a new BMC
wcid, and where none is free the add fails before it sets up the BSS,
while mconf->mt76.idx and the deflink wcid index name a BSS that the
interface no longer holds. mt7925_remove_interface() then removes that
BSS index and wcid slot, which another interface can hold by then.

Keep the BMC wcid of the embedded link as long as its BSS, and free it
together with the BSS where a failed add is undone.

Fixes: 4dd53cf06f01 ("wifi: mt76: mt7925: give every P2P interface a BMC wcid of its own")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 0908c22c3dff..b6eca78a5e51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -384,6 +384,7 @@ static void mt7925_mac_link_bss_unwind(struct mt792x_dev *dev,
 	mt76_wcid_cleanup(&dev->mt76, &mlink->wcid);
 	dev->mt76.vif_mask &= ~BIT_ULL(mconf->mt76.idx);
 	mconf->vif->phy->omac_mask &= ~BIT_ULL(mconf->mt76.omac_idx);
+	mt7925_p2p_bmc_remove(dev, mconf);
 }
 
 static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
@@ -461,7 +462,6 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	if (ret) {
 		if (mconf != &mvif->bss_conf)
 			mt7925_mac_link_bss_unwind(dev, mconf, mlink);
-		mt7925_p2p_bmc_remove(dev, mconf);
 		goto out;
 	}
 
-- 
2.47.3

