Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802450;
	b=AQcxmh0KQ4yET+CZ8leD9wVF/dnVv+KJu8r9QS3oielzeN8yLoR0hIqWuonZMondcBPH
	 WyFceWJku9Ge87EzRIU8WwDyIjHif7A79nVps7VNQeeiCrVgbKe+UVpIpkIiCEFFASCnG
	 CcVCslo7TeibZqzI+W3/FYECys/SKQwgOVp/yWhj/ZFKTjLAX/I0dG3hUPZbDVaGOShRX
	 qDn/eUjgJ8oW8xOxeR6z9Z4Ps6hWH4vGMPx+OA2WruJy7TP5eVr5bbwloPF1WgFyk4cul
	 vLXIqH7ibaAPQOTU5EYjMxugrjz6kgUpOCFokD8sy8Icm8SO9caUfCFpJh1xz1QjJKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XwKgANKcJWdfJEhncKT2P97cSAiG5m0jr07pBBalRlY=;
	b=XVCFK0gbH2UztnQVjxuwzxYhAxroYhzmEUlXg4RlLehPF+W8AhmzrpoJ7H/2Qt4SWmgI
	 7j8+YkpcuKDXH8xxt3BUKB4VUsFyesoYBWuXmQWp9JXNPDOSfsou/pq4NPvzIpS+2VRya
	 gWVecsS2b60HiuzpRYTW7T1d5Xg6HcjoTWDPgSzcUSs4aS1TCKi40z9GiRyBOJ6d1PnXj
	 zJGEWXRiN0McnmugeG5ytcaVOTzNTTU2jvigJw5ZIb37YrXzI3RuV1tcRGl4CQxI/lcxD
	 GPtOHKQIzSCPGUxNJ+EiqnrCpENzEiIFoTRyLPT5jhiBy9HVoF2rzoME4o1hLus5EMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hL6tSOBX;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6701606A324
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6701606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hL6tSOBX
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386d1859e1cso2587249eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 10:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802449; x=1796407249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XwKgANKcJWdfJEhncKT2P97cSAiG5m0jr07pBBalRlY=;
        b=hL6tSOBX2Sg/gw8c32IDOqUkHEV8i2ZMo8bqwlWXiK9rX88bYSzznQ12vDPGqEOZUA
         HQpCnS9X9BFgQ1xeZIvsVIrO2WZrX7h34qKHk1aESCK8+lnWx6u09JNbQHghS4XCzLmB
         XsL7EkFvUxvo002g67rDuM+oKF5oFVWiJYxKMIhLOnIBJtvItdL6Fu5RVwi4cHeYkLTb
         0bgK3T0mis+PJuEAF14Cy6yM+1wGvEel5TOg9msKbUPK7KAklbi5sYm+aKl03QMzmbp8
         u2aMG87mWTyRbetA2UZowuj0qcxfjWRdC431DpizTkTyOu5DvrODE7gleyxOtIFXOGLU
         px4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802449; x=1796407249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwKgANKcJWdfJEhncKT2P97cSAiG5m0jr07pBBalRlY=;
        b=gckT/KLMx9NRqEf6PhVuSKIwM6HkWdmE7K25xLIcoQGdgRnUQUp6Lt7gmIyANjVIbD
         dfrfwNzaIgnlAA8WHhslAXkCX06MTt7hK2D7waY2XUvM1Y68kCzo5rzLq686ZjxYai7w
         OEfJxnrojr7e6+pOGIkGNlsaNEmZLvVs/tnx/NJsYBEa/iNR8xFX3wFSV7rAogPzsita
         Y4nDbO5NlrS5qAc2S7sAm/PBLJyQoFostYRu6gEKnWcGyHXE/GEXePi5ziFnGKrZOdYx
         19kmlcac5UMpqPuwkXf5p9PPxxaaXIKZ5KB75AMo1MjLRH4kWuzQ3nVT8zqupOinHWLq
         Pi5A==
X-Gm-Message-State: APuU4Z+Rl7lMe3lTyIKbqvPyWw4uHlurV/Hoil2Wh2FWTBxILjQ0hlNj
	cGHi59Qvp8NMeMVhg1MhReg6Kygfkq0HucsNb/BSuNTTsJi6WFmZNobJ6OOjbnQ8
X-Gm-Gg: AZFdTZeLFZTDh8TWPw0mGh1ej/ZBXCeYrNoMlb198C03hOuWzumGhxm1gUFSbM5VNdF
	1kyiadDNXQNhLp8MHxWf0g4c4Y6pFJ+IxRWXMQBRtSCXFAw8DTOsouFqycq7Na7cqpZTlNHfTAb
	ufovfLL9JSWjO0SBUPBmohyYNCMtKSenyl0ljc50CNYe5x9UtZChPF3Ean+3q9Vxc27SS0Q2Epn
	AoX+IYUt5ycZ4VbwHsNUXnTyKiuISPscOr+0mXMreGHQqa+laBtr91H+aCmWXMzkAW2z6BPrvJD
	jckWPzsio4k8ba+OBXfZDSnuUdeZWSZKm26goPX62iYK/y1jRA9tVn07dkEeisfaAAI2EU+1Eph
	gUuhuNOrRTglre27qIn4Zlrl3JFoaIMspwW9DlaV0nRRWA4OKSghBg8J2VE9ZTqs0lP1RrQiJvE
	6p4Fo54JCp/rwWo/b9J5NsmMP8yU/Z6bxmZu1QQ04E4VCcE+H71etGoE2t6DdJEUkjCEtuVFIvS
	WnuL/ze8GIWlHTyNrnf7OUOYHUlIakTuKhPDGLups8VVmPlwXZRSgSgJRJMx3qlgSkrGneoLeGy
	Y2n79MnDpcf/4g8OK3y7AfT1QDvaLAckXbMcqoRWOWVPTKZskyeuvaJUUM+UA99RptRF46YJgTY
	AWZiJuk3kyXbzh8pEFw==
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr26688344eec.8.1795802448498;
        Fri, 27 Nov 2026 10:00:48 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:65f1:53d:ffe:71c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm76044620eec.28.2026.11.27.10.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:00:48 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v5 0/7] wifi: rtw88: extend 88xxA support
Date: Sat, 28 Nov 2026 02:00:20 +0800
Message-ID: <20261127180034.1058591-1-hjf3108@gmail.com>
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

Changelog v5:
- Rebase on latest rtw-next
- Beamformee caps: drop the support_bf check, so support_bf can
  still be enabled at runtime
- Expand the commit messages
- Link to v4: https://lore.kernel.org/linux-wireless/20261115114336.1739863-1-hjf3108@gmail.com/

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


base-commit: ae6b9e98b9045e47f609ec2a8197a3f3109627cb
-- 
2.53.0

