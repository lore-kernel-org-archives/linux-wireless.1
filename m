Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938512;
	b=LI7tNfzAvFIQ1RJrrTSlfuPV0UmfVDo9OzYt9JGDMXoeXxfbT71hzW28r6eIU3XGkbkB
	 Qm6539DUSEbnQuqifVBkPXek/tvt+LQeXvEpsR15YpdVl3Y33P1wZIvjFdi/2b+FsDNt4
	 saWLbjB2+RlFiT41ZrgDpCJWCsXMiOn+Odpk3687eWiUROBt1p5jZfnmhHWpDCmJ6NkQF
	 +x94EwFvAB/PH+mkFPL3+NDTDiBuv+3WantpTkXaH/Mj/95+ebqitIcr+vlzLfJJ+UQMw
	 gcPHpVv6EB35NKyn6k9SYvHppeABw97zdCMZO0ZxGypReIORYBjWg08mWexgKi1dqfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938512;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ealp7aF5H0dyGQD+H5jd7FzZWYJ1VzIuTROvQM2L44s=;
	b=J73bX7x/b10nLgQxIBdWHccbUNsnhSh9KSgFOjV3gjcSYiRtvcvVK9KBZDYWaoRan+cY
	 h323bRKj10o4xRfJptSExB0Z5y/PLQTDlqogUWjcIKULEmqphVjHqd3r+Z2upvmCPRqc6
	 nBNCAd1hGbJWXTfRxF8ArHw0l7SPX+slrvR8N6qOKTW+8Yn08xBqz56/OJrAB5Fw1kQ/H
	 idpF+X0ZgJlDGbeCS4fhrmhB7DTl63HEYUxPP2eChGvi9sO3P/3hCcTKxA64rmpBwp28N
	 kzGHs3yl4xBI7+HHmRECiILUTEcTvqSidqHW0ogTDmsraPZviDQASXop6ZSyaSQubJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=UL08mt69;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AF5606A8AE
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20AF5606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=UL08mt69
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Ealp7aF5H0dyGQD+H5jd7FzZWYJ1VzIuTROvQM2L44s=; b=UL08mt691cXF5kvViwUbBdQhEY
	9wEneEi8sUNKBHucYaZks/EBISbmhfM5DTtY38KfbWqT+E5IIkoQicXvp/uep0Z9iT6pqV2keAt10
	kIv4uXonMDW3Ts5zHQ0/X7/WmHGfm6KxKD94gLhpNhUxrBkmnpuTe+w60LT+OSOmX2cg=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV3-004eiZ-0b
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:45 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 19/19] wifi: mt76: mt7615: take each polled station under sta_poll_lock
Date: Tue, 17 Nov 2026 19:01:34 +0100
Message-ID: <20261117180134.2940930-19-nbd@nbd.name>
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

mt7615_mac_sta_poll() tests its local copy of sta_poll_list and reads
the first entry without sta_poll_lock, while a station removal takes
the wcid off that list under the lock. If the removal takes the last
station between the two reads, the poll takes the list head for a
station and writes its airtime counters to the stack.

Test the list and take the station off it in one locked section.

Fixes: a621372a04ac ("mt76: mt7615: rework mt7615_mac_sta_poll for usb code")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index ada40b8a517a..8e81ebe3e2ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -905,13 +905,16 @@ void mt7615_mac_sta_poll(struct mt7615_dev *dev)
 	list_splice_init(&dev->mt76.sta_poll_list, &sta_poll_list);
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
-	while (!list_empty(&sta_poll_list)) {
+	while (true) {
 		bool clear = false;
 
+		spin_lock_bh(&dev->mt76.sta_poll_lock);
+		if (list_empty(&sta_poll_list)) {
+			spin_unlock_bh(&dev->mt76.sta_poll_lock);
+			break;
+		}
 		msta = list_first_entry(&sta_poll_list, struct mt7615_sta,
 					wcid.poll_list);
-
-		spin_lock_bh(&dev->mt76.sta_poll_lock);
 		list_del_init(&msta->wcid.poll_list);
 		spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
-- 
2.47.3

