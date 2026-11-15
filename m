Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743758;
	b=vocxnagFR7kog+23MTDIchsdFqP/pfKfB08b0+QjlzyoRVXbeD+2TBkGeOjl9UiVX93I
	 Ac5VPMAYLSow71voeSTODJhg7EG2zCHYTWSe/Bu9rXdf+lQgOiN4CjBkctREuhLTv4ejQ
	 DlEExYnV2nerEMVPN+T5RFqU9Ir7UHlclvrMfBxspVxxSpU6HCoUXkdwq+fCICGfI/jou
	 12GPm8swXAe38gl/d2XkR23dxY0HICGqDC3CvJUAla2zTLKeGknuxpDjpFYPQW5sTaSI6
	 JApXc5GfxW8GMlWbbI6GjXGv2llizfQ++/Mrkiq5bGgiQ9Nn+h0/GBPVQN42Sap4VPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=U4XOjwAQ2BOIbW/PJ0TA8j9BUAT0ghRUzuZuG7wBy1w=;
	b=YHJfo1VeOM5e3v+PrM6EoROtyhApRSLBqDZd8HeVLmgIwVWGuYbIeouN9PHthFzpuLjv
	 1IQ4Z3r+F+E0P5iDM5QqYKfhsM/OFGKxXDM6cL9HraFnKE+2vf8g3FuLumt266lQvAMZC
	 Og3jS/NBdeZ3KM1a30ZBBUUZw8tjSCbYD4efT3LQYGGYfS8QC6nbQtk1aSSCsMtM9pi77
	 5SjJQ/NG01vfIs7fj1fuXmAVb6K0efrQw6nUxnHm00KSIUPv5ANv374caqq/t9nm0Xuno
	 1ZbACJcUFHLBxrecUIX2VmfGOdqORVSNZB040/l/vt0Caa81pOigtcftl1b1B/QTQjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1wXDAzh;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A37606A31F
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 11:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A37606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1wXDAzh
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso969938b3a.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 03:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743758; x=1795348558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4XOjwAQ2BOIbW/PJ0TA8j9BUAT0ghRUzuZuG7wBy1w=;
        b=Z1wXDAzhjNVI10WIK7v/6AqSuIruRxpc0Sbim4L5OLsdEqHcPd2U7tyQu+itwpcOI8
         Fle9AwKV7de8cp725gHnsJkpkRWJmNiYhyBphFBjExB+GmIG0F/VVwBuClxlYvogXA3P
         HNYhNW59TFSoX/Kzf/90k9bTRK4teCIfcMgtPFaTD28u0jM4e9KS33O7wVFRSB9rtpml
         6VY10sdSCgnU/oXhSOn3vm/18C2C7Ma7k+kcRaEZzebYACJqza34wN8TJjzeeBYO4bpK
         QqqtOWGx1hq8tcP5/kefneB4iQfbH/4p537R8wf388nF3JIHF5DgYd0iJkaraCIYBEXH
         a9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743758; x=1795348558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4XOjwAQ2BOIbW/PJ0TA8j9BUAT0ghRUzuZuG7wBy1w=;
        b=B2Cz4X7XCYIMRQSZJ4k26ghZZKXc/2fivudCtIhKB2j4ozsC6IYnDzwMO/Te19iv+N
         ZG1kDo0GHEpofOmR5HVwzIuczEoAvlooq2sPiI/CCy+1g561o3yHB6B3b+zw9MaBh5WC
         mCMj6IKwXiKuhviK1IZPyhZdgBupphnp5WAYA4h3mJ155pEK86Q0JhIg/lNKrCGBR1xM
         whdALEZaNhkdGmUlIhdekfU6+3EfUAkw9QIIZTMA91/ehxm+nP5wLcc/pAR1SQp3MgHi
         F61+jBx8yQ+4wQV4RMS7DvYRsYV/xUk1QyVQSz6kEya8tU2XbAaa7VfL6OyfZgWIA0By
         zIVg==
X-Gm-Message-State: APuU4Z/IYN0eFcIHZhgZAQzwKN7O0YK+VaVNX9+9wO3HMfABKPk5reTd
	kj4q4ffEIvjRvQctshgbJPJZ/Cqs0T/WPHVl7TLuP/ZQWSFpkCxuhieN
X-Gm-Gg: AYBFou34vf0qxqBbtGIGK7+oiCtrl8IfVg8bcX5fvNRmwj6qALGGHGxgwaNU53gzRVB
	QfaImh3wjWTp7kcmY8dMinS2hieFU0LSFTBJhiEmkYJstjgNezz4RqWs5D7rRLzH3Vbn3mY3n7B
	R1zJngD2/PBet+g9i5XaEdWRZe3eEv9DE8wVGlocZxnPVDXFozSOU9tDHYBfZ8Cl41HQ10OTE+A
	Tuqmi53vGuODhB2vDLLoFz7l+hHsY77oozFp+SD3rxVWPsDhm+Ef5LQFJ6ndDQhY49EySicSKHC
	J3l4uN4glgLcGFIN3Rrt0nuUb3XCBdH0pjT7rcgZjX7SdkiMge/Iv2swC4PfqUJOHTpl1cKfWx7
	pHUg2TlnHQn0gInzSbljiJrvPH+dXTkoaQvv9vNDk04hAEGRdhwH15h9FTjX+jMR9Hpd36p0KD9
	u+L/2VwrzZg1Dd2dCBRRcizYm2eRoPXjpcKOi/Unl2RQDDeBABTGZ+1TKHqNODevY7PovZvL4lx
	oXF2M4CuPuytJPiwEf3hm8o0GHuTf3MjUt1xM05rarKZc7yvUJnapkKCj03mTQ1Td6eKIdoPrMU
	+Fi91J624fl5yldk+Avf+GibJcybjY6ewHDfepsXHh6TJ+kihsiEKZlRasxeX00y7OTrt3ZCIjR
	vfdRk4pml7GZZ19C176tkkjQXrEwy6rXZ6bOfFAMgd/6L+av3bBbh/hymycRzcS3m
X-Received: by 2002:a17:90a:e7d0:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3b1b0a1be73mr6848483a91.18.1794743757542;
        Sun, 15 Nov 2026 03:55:57 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:55:56 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 0/7] wifi: rtw88: extend 88xxA support
Date: Sun, 15 Nov 2026 19:43:26 +0800
Message-ID: <20261115114336.1739863-1-hjf3108@gmail.com>
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

This series enables HT STBC transmission, VHT SU beamformed reception
and carrier-frequency-offset correction on supported 88xxA devices.

Tested on RTL8812AU:
TX went from 136.0 to 144.2.
RX went from 215.5 to 249.2.

Changelog v4:
- Restore "wifi: rtw88: correctly expose beamformee capabilities"
- Add a patch to skip the dynamic CSI rate on chips without a
  cfg_csi_rate op.
- Describe magic numbers
- Link to v3: https://lore.kernel.org/linux-wireless/20261112173246.3201729-1-hjf3108@gmail.com/

Changelog v3:
- Remove EDCCA commits since it causes problems in some situations
- Beamformee: gate on spatial streams instead of the RX antennas,
  in case an antenna is disabled
- Beamformee: writes RTL8814A use rtw_write32_mask() instead of
  an unaligned 16-bit write
- Beamformee: drop the chip ID from the debug message, style fixes
- CFO: add RTW_XCAP_MASK to phy.h
- CFO: use 0x20 as the RTL8814A crystal cap when the efuse is empty,
  following the vendor driver
- CFO: add comment on why min(...,2) is needed for rtl8814
- A-MPDU: set BIT(31) of REG_AMPDU_MAX_LENGTH, like the vendor driver
- A-MPDU: limit RTL8821A with IEEE80211_VHT_MAX_AMPDU_64K
- Link to v2: https://lore.kernel.org/linux-wireless/20261031070950.425176-1-hjf3108@gmail.com/

Changelog v2:
- Split correcting beamform caps into its own commit
- Adjust EDCCA threshold on scan to avoid high latency
- Link to v1: https://lore.kernel.org/linux-wireless/20261029055212.84711-1-hjf3108@gmail.com/

Ho Jie Feng (7):
  wifi: rtw88: 8812a, 8814a: enable STBC for HT transmissions
  wifi: rtw88: skip the dynamic CSI rate without a cfg_csi_rate op
  wifi: rtw88: correctly expose beamformee capabilities
  wifi: rtw88: 88xxa: receive VHT SU beamformed transmissions
  wifi: rtw88: prepare frequency-offset correction for more chips
  wifi: rtw88: 88xxa: correct carrier-frequency offset
  wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits

 drivers/net/wireless/realtek/rtw88/bf.h       |   7 +
 drivers/net/wireless/realtek/rtw88/main.c     |  17 ++-
 drivers/net/wireless/realtek/rtw88/phy.c      | 109 +++++++++++++++-
 drivers/net/wireless/realtek/rtw88/phy.h      |   8 ++
 drivers/net/wireless/realtek/rtw88/reg.h      |   1 +
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  17 ++-
 drivers/net/wireless/realtek/rtw88/rtw8814a.c |  75 ++++++++++-
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  16 ++-
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 100 +--------------
 drivers/net/wireless/realtek/rtw88/rtw8822c.h |   3 -
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 120 ++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |   3 +
 12 files changed, 353 insertions(+), 123 deletions(-)


base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
-- 
2.53.0

