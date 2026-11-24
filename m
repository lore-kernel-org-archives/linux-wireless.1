Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509795;
	b=UbpAs1pnu2KgjyvwJBFIq2IEoEtdGk7rMKm7vdTPSqM5+a9ygEbUbphrLMiToDc2ctgQ
	 vV5XFO48TnIdv2byYLIP0duC1nWIUx4RyZ93fzmdahKJ8zqZMxNRFegBpdJdiAMXq61OK
	 MICrEBNqrTdSYchzTN0An2yRZf799MVVX94ocH2suYHANGhafgfV1DAMBGZCBdm3eVVHi
	 tFZoU2GY/XhrjifqAKu+KwOTPX22+5mEZeNIZs6w5Sqo0CXI/auTpBUtHksOEBf2XxfNq
	 rQPi9BkqbexRJCT7dtm+Sipip1cJGS2X0D5Q8o0TlU1yhc1nsojHbVgmUURsbHh1JiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509795;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AYE0i1u3IP8XgNY1Tq7ONtC8KE7B6TT42XPUwE6Iv9g=;
	b=xgiv/uSNIe+kmCC33hPMBULBTNYC+irn0SdrgLeEYU4OVLx3NjXpan4qcOpOObDF8bHz
	 O0rE1ZAvedapTVIXfpLKu8ZHWRfN+i27JfJVQxCuH0fNxxF9qFUFivceVJlyyVX9vJNZf
	 7hnMCXPhB5wBpzWEQkweT1nD7dyODv2wbHZIRiL25ZTIA0sWBA8E3FCf47/VazNS0NLap
	 YN4eJy9eJ/4O3qkQ1DiT8JlUA0MbdT/e+Uapwebp4I2l5m8rH3PX62M5xhLRGn0fNwdrq
	 FtCUDv+yl8ApLpgjFVGqMzEPT8zlpm1URJs3KdvV1gw+5gLZlf+6eXqeSl2IKrhTC8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=HxaVmy8X;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC341606A692
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC341606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=HxaVmy8X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AYE0i1u3IP8XgNY1Tq7ONtC8KE7B6TT42XPUwE6Iv9g=; b=HxaVmy8X0xZ3KIu7MCl98BY2fw
	qFzA6Q4xlJJ3mTob6rWwDinVzZ5GLS0f85uOeOI6pi02muB/CLP767ntILNpuxh3EwCWDhfdSTI/I
	ZrC9Z8W5/d0jgFBba4VbMlTFK0HTG57AaEwju/OEi7sY00BnRpro3pOs4HT5A8pfljqc=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7N-007dJf-1i
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:13 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 14/20] wifi: mt76: mt7996: apply the PS sync bitmap to MLD stations alone
Date: Tue, 24 Nov 2026 09:43:03 +0100
Message-ID: <20261124084309.1981968-14-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124084309.1981968-1-nbd@nbd.name>
References: <20261124084309.1981968-1-nbd@nbd.name>
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

The firmware sends the UNI_PS_MULTI_CLIENT_INFO_BITMAP event after a PS
change of an MLD link. It sets a bit only for a record in an MLD group,
and leaves the bit of every other wcid at 0. mt7996_mcu_rx_ps_sync()
takes each clear bit as a PS leave, so every bitmap event clears
MT_WCID_FLAG_PS of each dozing station that is not an MLD. mt76 then
sends full bursts to a station that the firmware holds in power save.

Apply a bit only to the link wcids of an MLD station. The check uses
sta->mlo, not wcid->link_valid. hostapd adds every station of an AP MLD
on a link, so a station that is not an MLD also has link_valid set.

The bitmap also no longer clears the flag that a UNI_PS_CLIENT_INFO
event sets for the TWT agreement of a station. A TWT station that is
not an MLD thus keeps the flag until the firmware reports a PS leave or
the end of the agreement. It gets one frame per pass until then, with
no frame lost. An AP with no MLD peer already behaves this way.

Fixes: 2d16caccd278 ("wifi: mt76: mt7996: handle UNI PS sync events")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index fc56ce723de5..599bc6735c30 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -983,9 +983,19 @@ mt7996_mcu_rx_ps_sync(struct mt7996_dev *dev, struct sk_buff *skb)
 			int bitmap_len = tag_len - sizeof(*tlv);
 			int i;
 
-			for (i = 0; i < bitmap_len * 8; i++)
-				mt7996_mcu_ps_transition(dev, i,
-					!!(bitmap[i / 8] & BIT(i % 8)));
+			for (i = 0; i < bitmap_len * 8; i++) {
+				struct ieee80211_sta *sta;
+				struct mt76_wcid *wcid;
+				bool ps;
+
+				wcid = mt76_wcid_ptr(dev, i);
+				sta = wcid_to_sta(wcid);
+				if (!sta || !sta->mlo)
+					continue;
+
+				ps = bitmap[i / 8] & BIT(i % 8);
+				mt76_sta_ps_transition(&dev->mt76, wcid, ps);
+			}
 			break;
 		}
 		}
-- 
2.47.3

