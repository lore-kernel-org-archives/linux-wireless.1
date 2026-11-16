Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870999;
	b=oCkT8PYjkBEpuZ79vhPBbtG8P82esIrkns2LYx51ORbCHcQPsyNZBF700IlKdUVo6JM4
	 XaGlJL4znKnF93AmIONZjTWOQhEKtxJHnieP2i7MR1BaczcHLBxsAVrJpxspU1MFpgD93
	 sPYfHaD025sSiFr0wF6s8rQEsIilycITUFMjiY0nU/jUT0zSsG1b171qyV9hvsovF3Xjb
	 BtTB5aWEBuS2A4Cl10wXCQdyFs+3fUb/8j0ueba6UW0vKF9Dtyws55ianrd1DopWH45dj
	 xBhAUAO449oobVEXSmWR9+Br4QManilR9LfKDzYSKAnyHgB0L/yTT74ebE38bYHQssg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870999;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=A9KBuaqKW9NRLgpAmLyRiZPYwVxcgjbkYEelXOuGRcE=;
	b=kOBZK5M4o6F3G3MdbshVZlrd8aPu2tiSwjEEin/lqnJzUj0fOfYJ385bE0y5/xpT56qm
	 n3XBBXshmajPE41ZUVs4EHzCxtFbB+Zwfkh8kLm7lTVzKAxdXlBTgOzkxg6Oel5mp/utX
	 +28fwkCDdWaU4gzOO4zMMLtScGcubCxsJh7PObV82Bx5TTarHBEvWfhl/5PQgLxJMYbBv
	 4JmU99QV5YzbGZIBWCeE1qFo5ohyHT/ga6Mr5cvO+0weDYbVuyilx7N/carWhWf+b9cXs
	 VqcAzo2nVQPCJ0v5Xkue5Va69QM+OkujH4CqRRI7fiJ2+GOiATv58wmT5+v7pFPwaSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC1D606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC1D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8479f46ecd8so1455169a34.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870998; x=1795475798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9KBuaqKW9NRLgpAmLyRiZPYwVxcgjbkYEelXOuGRcE=;
        b=uE5UinPHNVDZvO3Jx42rYEPijmpeqKsQt1kM8U70a0DBCzfCrDiB7B7auUtiU3cg7v
         dbn6Dre47SXdCMhfPdfoNLUi/zE74ZP1tg9D1b3+eCnBITh/4sFugbpWBfDF6/BTJxBC
         MHvpNyL2Mep0Tt1g04v8f0e2mXy22t84BNplSWm43Uvh9F7GDXsNJY/9L/Di+G6mS0Zo
         1d1U4sw2sXEOD0XYZvp2jnFU4SaIV8ngzGMqj6aFP+HVgCdJUUMTlmlZb9YvXCl1yi82
         QY1/0edTygQd/r675yskyY0sR0iOCQvSWAdFn9vKk4N90mhzlYdeaDA2kzF8AAnrhkYK
         Ao7A==
X-Forwarded-Encrypted: i=1; AL+hErG/Vno6KMMmgeCIi0tTcyITzkzpuDmbeXJ5kw59ZU4ROrxX/e09ix4OpjOPkDplVtaUv1YQOtL2TBArPf9VUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qIvu5CmxgrsSlmOK44ehksxi/6shtuGWqMqJR7FppJM8SQFxf
	i+6QOcnGyuyOBeaahdpZsLzdri9R3OyhjgB/+3YTWawBtNtbQFOgrf5qNdewOg==
X-Gm-Gg: AYBFou2V0dUqdg/7Vguz+Wpzga1HGUl+/V+ENy5MeTMJzXqMtL0uzy5tFg2/aBk0tlM
	BXf7YQWzEWkNUr/UHTaqyf8i6+ut5W9CVJd3L/kGjTeNHsRQrLOB1/NqY2qQR65SEmh16kSN8Z6
	sE1ig3gY8nN/dTq9KKw0+5SFiuIuRyw6/vZaxRwx9GgfF2MLgsG0Uo+C3OvnWzC+IOGKPoNXrOS
	61riircch6fLdolS1jL5n4DeOsJThvDtgQmlGgpb1YPzD8G2o5dT2HusrENwaxq+Mdnb0FTtsL6
	W+Itw+MlO8MRDYqH9LjxnYnM55nhUFKuvNXqzymlWmI1UXQ+sOEtgCdTJYsE9dAdgP365z/6+lC
	YXE1rt28mYdLQJfkqOMBJEaiyOdJLUcRkkJTXisSI5xZawHvJBBBkMS9KvQM0/dPkHc2zZO9Dm4
	bYCMTvtIAym7IGBy6KRNfIvj5HtsX1YgTaSKEJIKoh6QP8bDMdQ9oz6q2g7OzU2rMe43/NlL41M
	mUeSCtu6rZBB2NxYhqjclatbSd97H/xorB1trD1jfFAJ+9qUZrkfYHlv7dpoHuVrBVzgSGou1jV
	KR2Wv1H2sC8q9g6aqUfR5hxP1f/Dzo/AxLXXQELGR9KZvyKCXsCVxyGjg2ACLpVJjIfryVy0RPm
	xhoD+3y0B
X-Received: by 2002:a05:6808:150b:b0:4d6:9283:1bdf with SMTP id 5614622812f47-56e6542e524mr8646041b6e.60.1794870998341;
        Mon, 16 Nov 2026 15:16:38 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:16:37 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v2 00/19] wifi: mt76: mt7925: add NAN security and improve NDP reliability (part 2)
Date: Mon, 16 Nov 2026 17:16:11 -0600
Message-ID: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
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

This is part 2 of the MT7925 NAN work. It continues the 15-patch series
that fixed NAN operation and NDP performance:

https://lore.kernel.org/all/20260824195227.12589-1-sean.wang@kernel.org/

This series adds low power event control and key management for secure
NAN and NAN data interfaces. It also makes unicast management TX respect
peer availability and discovery windows, and fixes shared BSS teardown,
cluster event ordering, and device removal and frame lifetime issues
found during NDP setup and teardown. The last patch lets the station +
NAN combination use three channels.

The 19 patches here cover the mt76 follow-up work. The separate mac80211
NAN receive-filter change is not included in this series.

Changes since v1 (23 patches):
 - Drop the NAN MAC address randomization patches (v1 01-04). As Felix
   pointed out on v1 03, mt7925_nan_start_mac_randomization() had no
   caller in the series, so the work never ran and the NMI/NDI address
   setters were unreachable. This also drops the NDI setter that Felix
   asked about on v1 02 (whether bss_conf->addr and the netdev address
   need updating along with vif->addr); that will be addressed when the
   code is re-added together with the interface that drives it.
 - Drop the NDC-aware TX GTK table (v1 08) and fold what remains into
   "implement mt7925_nan_set_key". As Felix pointed out on v1 08,
   nothing ever filled nan_tx_gtk_table[]. set_key keeps returning
   -EOPNOTSUPP for the NAN_DATA TX GTK, so mac80211 falls back to
   software crypto, as before.
 - Patch 19 (allow three channels in the NAN combination) is new and
   independent of the rest of the series.
 - Rebased onto the current mt76 tree; context adjusted in a few
   patches, no functional change.


Chengwei Yu (5):
  wifi: mt76: mt7925: add NAN low power event control on suspend/resume
  wifi: mt76: mt7925: implement NAN key management MCU command
  wifi: mt76: mt7925: add per-peer RX IGTK/BIGTK and RX GTK WTBLs
  wifi: mt76: mt7925: implement mt7925_nan_set_key for NAN security
  wifi: mt76: mt7925: install NAN BIP keys standalone in sta_key_tlv

Jacobs Wu (14):
  wifi: mt76: mt7925: do not disable RX NAPI twice on unload
  wifi: mt76: mt7925: assign the interface WTBL to the NAN management
    TXQ
  wifi: mt76: mt7925: do not deactivate shared NAN BSS on peer STA
    removal
  wifi: mt76: gate NAN unicast mgmt by peer availability via STA queues
  wifi: mt76: mt7925: hold NAN mgmt TX to the discovery window
  wifi: mt76: mt7925: double the retry budget for NAN unicast management
  wifi: mt76: mt7925: let TX status of DW-held NAN frames outlive the DW
    period
  wifi: mt76: mt7925: defer the NAN joined-cluster event out of
    NAN_START
  wifi: mt76: mt7925: steer NAN handshake frames by committed-bitmap
    state
  wifi: mt76: mt7925: disable only the RX NAPI instances that exist
  wifi: mt76: mt7925: stop queueing resets once the device is being
    removed
  wifi: mt76: mt7925: bound the lifetime of NAN unicast management
    frames
  wifi: mt76: mt7925: always deliver the joined-cluster event through
    the deferred work
  wifi: mt76: mt792x: allow three channels in the NAN combination

 drivers/net/wireless/mediatek/mt76/mt76.h     |   1 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  23 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  97 ++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  30 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  11 +
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   3 +
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 604 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/nan.h   | 115 ++++
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  19 +-
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  58 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  63 ++
 .../net/wireless/mediatek/mt76/mt792x_core.c  |   9 +-
 drivers/net/wireless/mediatek/mt76/tx.c       |  25 +-
 13 files changed, 1019 insertions(+), 39 deletions(-)


base-commit: cb766c8865eb6b6d2c2372047f2e41d7d2e38449
-- 
2.43.0

