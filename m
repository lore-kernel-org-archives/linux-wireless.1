Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938510;
	b=uJ6CDg2/abUag/EzzE842JkV18y1UIluTVBd7kwe16Vk4s4os0/e6Qdm/Cb9ZfhFhEbr
	 UKuootQAjUZFe+HdhbKfOwr7TG8D9x/lSi6nbki3OKwgTK5do5xhAL27rMinNpHKIhGOk
	 sfDVixOsBNYwgRwaxHvY+t2ZRI3yl2STCuQmt6QRx07EOlXJsiMGnJAWUMMeqRsbUfe1k
	 TlJ+5onHTI5sEiMPJ5ATztbmxfcXyo+MXuAG4og7dIgdi7B/znmouVgM5pS4uuqLEeS2R
	 sCAFX1yqoBLYLKMlvQIOhz7PBz/aTFcXszE5Y8oXum+zF5juHP5BM5hUrkYncASkdsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938510;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rr6lp8BScajsiT8tmIj+/AZ4o2DKEsadAOceAdtslaw=;
	b=Sw/OoXMixme07m/o2RsPpetPa5knrD9irM9tnWzDPbjuOONJ8YkNCGPgRhVLKECpXjaX
	 Xz4c0I9d58GO4M/QkwAB0C0KL0m1aeiirhQ5e8ZqKh0yb8SKBwTB/5aJw8S3cBWZUxAY8
	 b4ciMz5Dz96uOLgMLq6t0gEwAZtNchl3ad5n+qh/0Pv0i86p4HbMyUjEPrr1t8b4/W7j3
	 I1C82xaEHNod5FNf7tRz1FGGjTOUGBtCwB+nG03Kc+k2IRvQUs4tOyHZIb7oRmWvPzu4i
	 m9xr6xOmaBiQQf0EMpxxT9vpePh3scFPpBYuZ090l7o/xN7Vs17RCCgiMQerScJFCvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=YrOiNmPc;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4208A606A333
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4208A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=YrOiNmPc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Rr6lp8BScajsiT8tmIj+/AZ4o2DKEsadAOceAdtslaw=; b=YrOiNmPc6UUeIUiPrkLPBD20Qx
	2/P0F6UDqzS0gAi0L7wqm/J/dXwysCI2bHkNs8bR/nl9ocobzi1rmln8VoxjXm/oSxkET+BEMLNP4
	dKEWuCjnShTkBKHRPFVluxIM8YHzxN+8Gh51SmQ6uQx6DtjU/qTqvLmRCzuKhLjZJfYY=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV1-004eiZ-16
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:43 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 08/19] wifi: mt76: skip the radiotap TLVs in mt76_skb_get_hdr()
Date: Tue, 17 Nov 2026 19:01:23 +0100
Message-ID: <20261117180134.2940930-8-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117180134.2940930-1-nbd@nbd.name>
References: <20261117180134.2940930-1-nbd@nbd.name>
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

mt76_skb_get_hdr() skips only the HE radiotap fields, so for a frame
with EHT radiotap TLVs in front of the 802.11 header it returns the
first TLV. mt76_check_ccmp_pn() then checks QoS Data of EHT PPDUs
against the counter of robust Management frames, and
mt76_rx_aggr_check_ctl() does not see a BlockAckReq.

Return the mac header for a frame with RX_FLAG_RADIOTAP_TLV_AT_END,
which mac80211 requires to point to the 802.11 header.

Fixes: 97d7ab9f51ec ("wifi: mt76: mt7925: add EHT radiotap support in monitor mode")
Fixes: e016239fcb98 ("wifi: mt76: mt7996: Add eht radiotap tlv")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index da135e76aabb..8f8388d44aa9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1485,6 +1485,9 @@ static inline void *mt76_skb_get_hdr(struct sk_buff *skb)
 
 	mstat = *((struct mt76_rx_status *)skb->cb);
 
+	if (mstat.flag & RX_FLAG_RADIOTAP_TLV_AT_END)
+		return skb_mac_header(skb);
+
 	if (mstat.flag & RX_FLAG_RADIOTAP_HE)
 		data += sizeof(struct ieee80211_radiotap_he);
 	if (mstat.flag & RX_FLAG_RADIOTAP_HE_MU)
-- 
2.47.3

