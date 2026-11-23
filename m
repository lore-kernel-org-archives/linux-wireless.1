Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447329;
	b=jA4L0LoMvPKX7FiGkO4CtTzymGmZ+21IacxBKU5Orz5fMCBFhx++pnXb3tM2TyVp1C29
	 cRlRFt5rNHUie/RX9OXKlJ3m3xQPPdy0YKEYf3ss5XDT1gMLQiD+w33C04gDtFBDdFNhf
	 pfiTEKu1XlqCmmZ7aJInFphCvH3VNdyhs4oiQKF8I9OwbcYr6ZSOxrM5orl4aAmQjarsL
	 VWtKzEM/COXnh/X+B8eS9bOuLLOKCRDYemK6JjB5MzL9z+IGgKRwOczrQ1FEdkljxeSuT
	 zN2YYMo7NhbRs4IsHu7gApHTn8iboYVhb3bSR+GqknHIV9SSq+5WIrYZKTKKJwu2xnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447329;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=v8zKp58yyLFt3dB7QJADCCQYCEc5lgjCH9XzEzv79aM=;
	b=0ioXOgCbtUyO2WJqEZaGXvmkzSVgzGMDNVFZX2vDyywq23cLLwAOHu3HcfiiFjpskJhs
	 IAm63jOkegAALGODZmPVH//h/6VugcfoxRexCldftYtieuehsKeM31+KaUNGshw2BVDU6
	 iYc4WlxZwUsQUtNvGi/PzOJpdnrIVmogEUic9YPAvoVbHga91uNqpZJ+nCaHgCXjyWGJI
	 aW6MpozJSmwQ0S+McWHqfiT68tyekks7+e+9Ls0dTdwcUKvt4hdFGJUQcf/Dyg8V1fGSh
	 ZilAMuFFMMi29uDW22O/9TkUToco/8EeeKmlyPhEjuHqcc5DOJx7hGrMKDdt0M2qmuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=bl5wmz5o;
	arc=none smtp.remote-ip=91.218.175.34
Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF148606A31F
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF148606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=bl5wmz5o
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TuoKZdA/7wPsWYl6vUS1ef609FzzX3aYXg+j/s/iJcI=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795447326; v=1; x=1796052126;
 b=bl5wmz5oc1BN295M8MSurI2gCWDsbryODxrb3TT3azp0ATY/Hpoewjts4OygVuGSXD9+V85S
 xJn1HWUOHoUeaQq5pv7VuQ14E3xi8GfCNCgAkb6aQgaACd96qLwjSZS3jEWJ8/kqF1oThbZ4WxR
 l+C3i5nwO4Cr1WP7HTW9ukbASakTm1wqvbtsqSXs008c+NbytxYZ9VJ+vGN2KnIy7U4qIDm7eg0
 lg1OKmBMeQztGnOrttYhACaPzw1+VI1PGT3WnCcnho1yjV87lpS0stC8X5OTZbGfTK1aRx+OPHe
 +lt2doWmlC+DgZ2bq5ItxgaV8HDFGP7WPLo/i94bqsFdA==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 305311556e50466b;
	Mon, 23 Nov 2026 15:22:06 +0000
X-Mizu-Trace-ID: 305311556e50466b
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	Alex Gavin <a_gavin@icloud.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76-next v2 0/4] wifi: mt76: mt792x: make active monitor work
Date: Mon, 23 Nov 2026 08:21:50 -0700
Message-ID: <20261123152154.99634-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
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

Before 7.3, an active monitor on MT7921, MT7922 and MT7925 never got a
channel. Since 7.3, every mt792x refuses one.

Patch 3, Mark's change from the morrownr/mt76 tree, passes every mt792x
monitor to the driver as its own interface, as MT7927 already does.
Patches 1 and 2 keep the sniffer on for these monitors, and patch 4
offers active monitor again.

  tested on         MT7921AU and MT7925 over USB at both speeds, MT7922
                    over PCIe; MT7925 and MT7927 over PCIe on 7.3.5
  active monitor    hears the AP as well as a passive one
  passive monitor   unchanged once a channel is set; with none set, it
                    listens on the radio's current channel, as on MT7927
  after a scan      a monitor on MT7927 keeps capturing

Suspend with a monitor up needs Felix's mac80211 fixes [1].

v2: rebased on mt76; patch 2 also covers mt7925's power save code.

v1: https://lore.kernel.org/linux-wireless/20261027195803.711995-1-lucid_duck@justthetip.ca/
[1] https://lore.kernel.org/linux-wireless/20261110185436.2015505-1-nbd@nbd.name/

Devin Wittmayer (3):
  wifi: mt76: mt7921: keep the sniffer on for real monitor vifs
  wifi: mt76: mt7925: keep the sniffer on for real monitor vifs
  Revert "wifi: mt76: mt792x: do not advertise active monitor"

Mark Anthony Agarro (1):
  wifi: mt76: mt792x: pass monitors to the driver as real vifs

 drivers/net/wireless/mediatek/mt76/mac80211.c |  5 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 82 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  5 +-
 .../wireless/mediatek/mt76/mt7921/testmode.c  |  4 +-
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 76 +++++++++++++++--
 .../wireless/mediatek/mt76/mt7925/testmode.c  |  4 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 10 +++
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  6 +-
 11 files changed, 169 insertions(+), 28 deletions(-)


base-commit: afe54fd58a8781c1e96b81e42bbb67851a61ed18
-- 
2.56.1

