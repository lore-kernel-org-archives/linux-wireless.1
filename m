Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694863;
	b=JPc2dXUSB4nNh8sLnd1tn9+eln/vsS8eIJXJHx/fyQ/aaI+7NPeTRuNC2ZyHwQEbKsqo
	 xmGTMK1ymDKsGGCIkHdXueR5Wj9nf5cdZyo1FPsSrw1dRPrbNl8C3ZVx1AaGKqhh3X1+R
	 ohMi2xPGgqI0mES1kb34wgyjaeKbBKrs4lDWESdbhKvR+H/A8QhRkeZnpjVfKu4SfallG
	 cDYJ49lYDsdP7tXrC9QwkDZaHabhfHTxGupjzYwZUKzuohbJ5DCEq/lADv7xuRrfIG2Ri
	 cchnjI08Z5J5alaECfWtpW9k81BEk2rUcYwhvmmDyjVZ7qiLT7S9NbrUrhtAx2oQyMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=;
	b=Mdtc3kdo6eZNDskCsDlrhvypRY/bJk2A1OLy5Bm3afuiwyit1b8ReyJ5wZ5OMiFA/FfB
	 v1MvifBCNpqxaV57UNj8k6s0VOixm84+lnFT6l0uZj0Oqq+JfuCeiXsyqMnZuRhK2MDLN
	 dkLTMwBDaSBxOSMBquMUpzu3sEZ5d8osXbso/e1oVtF6ZNt5Gj1wDVxLRK4Ohc0stAzfj
	 5E7vSiB/jpZwctuAO5KsiJ8+5TElxddusUbLImZgKCuRgRXEKCKIKSIUWRek61hc7ooho
	 ucMJfTKn4gAgzbr6/3QM/jJGSaVxjB32gVkrZTlRJfJaFSIE1/WOU0fMmUj692jjW8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hrUyFfUi;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90321606A32E
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 22:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90321606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hrUyFfUi
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40f29667e6so421428366b.0
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 14:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794694861; x=1795299661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=;
        b=hrUyFfUiHZIJfuaCs5+r9SLMZXsqRGlL1RUx4DAD+ET3JDh6rPTUqFK/6YrU+CRv1Y
         h1yLcdwf8enboao1bvfWeAX0zoRyF/MVc8XnJcTz2nzVCu2JsLw+iJfMauwq5agehDRo
         n0GvI6j0NQkO8aj6EnU5O9kT4T2k9QFArNuBOX5mUMyfQ/N4ypjim+6xLPZcDU+UvPzD
         qKxslKdnNkA6y4wHVoK7SqqW41RXqJrexMEqYLJY1JgK7QSsovh+FADgRc7xqAxgD5Gj
         esesVVeNu9T+pItTNOolrsakMLD0dzw83cZBsN6sI7gOftC/9CDPAtVvUOCtHIz8nVPs
         4Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694861; x=1795299661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=;
        b=r3yV3ZLxf9KnI3T9jLFYlVxUd3U0bYS+zXwrHQFqPC0jV3dPA07lAsmMMibXFQAFOy
         +MN7pYeQza26pQnXZMePk/HCxXirziZpfiK9IxUM+ut9WxQIpyyc2srKi1tc87hiMvL6
         L2qsLpgmFNQU6izF+SNyLiTxDR44gQax0t5D50ZmHR850QTa8aJJUSjvlQj5+SxZsfkI
         1ICl1PAtWpdFXnQtDJltwnBpmRipG86kAgi3WkRv7ILG7Xh7V7xpf+dqlREh13zI/+47
         2PGkN1+MOULcbBpsEqyy+okXxDH2gmEr2RsIq2l2xOZiwKtnBC/csEngzVgFL4+crDNg
         pJdg==
X-Forwarded-Encrypted: i=1; AL+hErGYiaqEKklq+a+FsAVvROCuM8xco5WvGUb9IiUoxnxd0OMsmdwY6T1L+iq8YnxuWZpq/e4azF3Y4SxkFNwbBw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+d6+jSaOQab+vIcGKIhxx0ki6vDpWJ/U6chYehChRya+cZD17e
	Abitq3lfIw0cdQ/AvbWmCupU+1ynhZ5+TtporuHOtwvCHgPgx5aKW4nfZ02FOrM5PQ==
X-Gm-Gg: AYBFou1HzVLwdC0d3W3mHQGmfKkMDemrzCCQS+jzXyqTe6ExDlOWTzyR6QoAntQI246
	bUiCloCNOaIj2H/7weYyNVZ2KNSfpyIwCkXMgH+zYDg86zh7NhknxcKA32zJ484D2qaZHTTpHI7
	GhpfZPirql0ja6HsKgJU9Go+0mKVPuyXPz5zJNZGZwaD0quWrctzoo3VRQUlr/mYuRaGA2jNDpp
	UTkyT/ZD4jstcMjD4hgOFhgSuUzGNadURqFdoApYbM3Wsk1TrIMDDqxoSKSlQbtM6HEQ6BkK7uu
	dznk3bx9N9lDGbioA/KpQzOAJqMbUxzZrGGwDbVFSeprhGUW077kJ5DIDTE3VenDGGHWHXPC2mw
	/Xj943mp78HqeYDLfLEUlX4ZIBaTtywWzh7YO3EGRoCAEN16lrXXrLDNWPPFzkiznY/hkoI1ato
	1hb3vSwgyqhI1Gn8UMv101vuxI0faAO9ZeUn6YfgUj37S7nyVYfd6BfZy7b3Uo7ayMQCk59Zpo+
	+rD0Ln8QZE8TRsqzkdZnS5Z+fktwp6NUA+8K6YDXgO0/lVB1DOR4sVEOe53THmNu3denguwXdLG
	s83xou11SjUowpVtVIBxClzvebwIhHXj98/mj9fbfuor77GyXZU0lY0ZHrJl2cGs1e+v+s9Yj+e
	CaWrI4jEwtkeZn4C0PmK4Btdm4Oc5l6AaD9nzrY1gEXtdIfTYp08e4EoxVB1Sd9cf4PQfDd1QxW
	OGf9mbW3zmc7J18uA97PiYyLaRT5bm5iSDge0NpaSMhz+lDh6gFxhyJzD0KhKn2oorGv63SO2uu
	R4UXyKWv2CbygkZswB87ada0/bqYvC3WUuvwsEhRH8u8mqDgPAidW02yvRIw64bIRaemcyw4J56
	9uHvAMLR1yijadBe50qvBEZTM9AAxzAwq5VRAWzDxSQ2/SJOpJPQOad5q7KWXDRh
X-Received: by 2002:a17:906:5146:10b0:c46:645f:cedf with SMTP id a640c23a62f3a-c5096398ad5mr419322766b.15.1794694860698;
        Sat, 14 Nov 2026 14:21:00 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709d9006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:d900:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b1fsm255612966b.21.2026.11.14.14.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:21:00 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 0/2] wifi: ath11k, ath12k: request firmware-2.bin directly
Date: Sat, 14 Nov 2026 23:20:56 +0100
Message-ID: <20261114222058.184034-1-julius@bairaktaris.de>
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

ath11k and ath12k request the optional firmware-2.bin with
firmware_request_nowarn(), which silences the kernel's warning but still
lets a missing file fall back to sysfs when
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y. User space then gets a firmware
uevent and OpenWrt's procd hotplug handler logs "Could not find firmware
.../firmware-2.bin" each time ath11k loads on an IPQ8074 device that
ships no such file.

1/2 requests firmware-2.bin with request_firmware_direct() in ath11k,
2/2 does the same in ath12k.

Tested with W=1 builds of ath11k and ath12k. On an IPQ8074 AX3600 with
no firmware-2.bin, 3 reloads of the unpatched ath11k module logged 3
"Could not find firmware" lines. One reload with 1/2 applied logged
none, both radios came up on API 1 with WLAN.HK.2.12-01460 and dmesg
showed no warnings.

v2:
- add 2/2 for ath12k
- drop the Assisted-by trailer, target ath-next in the subject
- see the patches for the rest

v1: https://lore.kernel.org/all/20260910071838.1983652-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath11k: request firmware-2.bin directly
  wifi: ath12k: request firmware-2.bin directly

 drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
 drivers/net/wireless/ath/ath12k/fw.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0

