Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938513;
	b=PmRPE3cEm4eO77L92a207u4rF6SjWrd45AR7mMbUGt74ki3WvIE5tH8J3XdKwtsLukyO
	 q0mUiyTAEHjc+uDkvIr0OY6J+kgmfnuh0z5T8QkVYzV4fQEI9YjsOvH1M4wC/1MJ71R3u
	 Ak6SgDHpFBLt0x0GQo2poAc0tbTaHoVhXnDbMNr/83ZsCb0Zafs9AZeV2teXVCop1gCc7
	 g1h7Ua7iCVX/Qaf0sSTgv8R7vX9w5MXbEZjYvCs33CxgbTMv5zFTlPUEQPm3rTQX5GtI/
	 H5RwT8CGzwnjBbsFE4f6hqfrG766BK694LClGD7K0Ack9qBVGNEWNcdSr2TW5tPVhqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938513;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UShBmXaMV38pkuYWU9jo07MuqdTdy22w1riSQCc1IH0=;
	b=wtE5krETpiRczlsL/4qTtaedg9sYE3ZirSFdtMpTYdn6cPpEZHBgKtK6u0eeJovkZgiJ
	 UqD4ExeqXi5x257NKIAiBkmIhWgT00qjueWOgWFwibDIVjRODkAgknQKmzYfzIkKu9f7L
	 +UUgCtijwjOk/DAHGPvP1VeDdPPw13Gk7e04Y3v4gk+rt68lPjDQZsMqAgioI6gYOSnKu
	 XJjfQ1Dm4ADg0rlTT3rsclEIWj4EWAITmxRRmUfUFhCVuvVMXXgRluKNqw7CTrkTm1NwL
	 EFpgEQ8NpJIcJsd86+ogYea/y304Shu5TssOqnB49ADQ3RuJTBv8PY12bt90J46ufVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=MGPhKeHk;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3E3606A338
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F3E3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=MGPhKeHk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UShBmXaMV38pkuYWU9jo07MuqdTdy22w1riSQCc1IH0=; b=MGPhKeHk/MiX1F14mW2ow2ushd
	/XjtGxRMvTp2o1kwweJwbxnt9r9fgvFg+rraMpO3D7zZLp+Yrr8Ry9DrRGcUxJnPEGLsD2tEXXY1E
	hcaQ+58XWIBXlo8AvPm0d96iuufcNtbldrbBbqqhM8uWmV1hYfM3pgWhxmbCQ8oJlrf0=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV3-004eiZ-04
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:45 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 18/19] wifi: mt76: mt7925: take each polled link under sta_poll_lock
Date: Tue, 17 Nov 2026 19:01:33 +0100
Message-ID: <20261117180134.2940930-18-nbd@nbd.name>
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

mt7925_mac_sta_poll() tests its local copy of sta_poll_list and reads
the first entry without sta_poll_lock, while a link removal takes the
wcid off that list under the lock. If the removal takes the last link
between the two reads, the poll takes the list head for a link and
writes its airtime counters to the stack.

Test the list and take the link off it in one locked section, as
mt7921_mac_sta_poll() does.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 5518960e1375..2528c2f5d717 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -54,12 +54,14 @@ static void mt7925_mac_sta_poll(struct mt792x_dev *dev)
 		u16 idx;
 		u8 bw;
 
-		if (list_empty(&sta_poll_list))
+		spin_lock_bh(&dev->mt76.sta_poll_lock);
+		if (list_empty(&sta_poll_list)) {
+			spin_unlock_bh(&dev->mt76.sta_poll_lock);
 			break;
+		}
 		mlink = list_first_entry(&sta_poll_list,
 					 struct mt792x_link_sta, wcid.poll_list);
 		msta = mlink->sta;
-		spin_lock_bh(&dev->mt76.sta_poll_lock);
 		list_del_init(&mlink->wcid.poll_list);
 		spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
-- 
2.47.3

