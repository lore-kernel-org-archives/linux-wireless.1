Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542391;
	b=5WLRULwLwEBHBLxlau/bpWBDqXHfy4h23Zrgg2Vx9l2aXlNcYx68dTFW9Cq76ErkIw9m
	 5nvtvjlr2yUYNpWsMK3Trhei9Fnfy2fssGnWk51ZoUJJPXsXj7UAGm8di0QKbaLHLhgng
	 0zmsaAlYCUBJAz0qGn/sF3ksdzEk5xMFMdaBq+hdVKWYoVTF3D8bfYY+w8g9T9bcu37QM
	 VloiRBx5mDvfEbyezSbTkfAz+SgnR5VpQNs1TGlm/TAObVF8KgjzzI5m0hj6GnmdAdtuD
	 V/n9FgFiFFeypZP6fB/ByE298tjxcharm44sfZsXzqrK2XnzmrHZLaJBQfG51larIrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6FzGEAlboCDO+hR7+aZbs5sdkOEtttyfXNAxL54wV1g=;
	b=jxxGQ3XGRLJeqOCHRp9HGEtHornPpFjP/EtWh2V8+yJ/Ejx0jMzPBtDvUzPkA91pikWA
	 fO3vV+TAVf8/xUJ2GqNSjeN6xBV9vZ2Iz9UAp06w4STcyuY9G/FHmIcIKO6N4TkYW6duG
	 ZIJ2SHaFWmHSg8NAffsD712ieiEHFQQAULUeOGubW2HwDrXX9NypLaetX/mtooFx21qTB
	 zRFGtDmYN/vZabzZBp/ocM97dyfaERRAq3M/9L6lWpfenBzkGwLBTKIWnPaLWAsuzFEa3
	 f/7kFkMd809qZtcPrt0VqaE41gx3P38gkYCBdslA2NRvlxD2/jRBVm2s9rHM/NjAhcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UKzSzSxZ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0B606A329
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 17:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F0B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UKzSzSxZ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so50480905e9.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795542390; x=1796147190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FzGEAlboCDO+hR7+aZbs5sdkOEtttyfXNAxL54wV1g=;
        b=UKzSzSxZe/rBogTWMgQUwqoy5hQNNPs3K3wQ4VrW7G+GlN19pr42/QXX5xnRzYk1Ey
         hkf03ENDW0g3vM/Tr5llw2NUSF4L9A9eWP8imgZmwuAU5X/fIHc05bQBpoIcJru5RQ0z
         ek1yC9my/97YtXAA9qC/YqONIXxpU3QNvB+LnhCrbITrRsz2o7vi5dq8kpQ6aSoSVBeB
         K1GuYwoGWbjFIkE1TYkYiKDj1tflfhCll3mCPG6d/gxuBcYyV8cxZzthDjyGglUYikSX
         tKCGkMxyIx0RrY7rAsjwn7ZfhTneF12GzW1CPc9aiKmO8dMcykCyR5CI8nwFxKwvX8dC
         v95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542390; x=1796147190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6FzGEAlboCDO+hR7+aZbs5sdkOEtttyfXNAxL54wV1g=;
        b=k/Y/Xz/LJxujvPX5EYs3+R9U8QNi/KgTzJ5dO/bM3zCkYhZOWrcjtLDHjNE5axwh59
         0Pnp8SH4BJLYDnbUM22ZXPwmj8lt2kmCned/Jp2ykJuunXXslUuB0vJiJJo07dWnDtHT
         +INNVq31iUwpwoZhVx0X7+cEBgqbpLSCTRFuguDRfRsBaBZmfv4osZWZZESqewWWBvoB
         5MyFEt0fkJmmwdpCir1eElhPOn/TY1cHx9NPDs5nn8n4QGbiA82YplgnDadgsV9QDxJD
         De/JUTzdfOM42sax1R0uN4bTXZZSsxZ0+GOiEwc9yigt9MEDMdO3cRp1SXcb5qR0c41P
         +opg==
X-Forwarded-Encrypted: i=1; AL+hErGYekEtUqssmaZ5rcBXDTF9aBN30E3onW5dcdyilUY+EVFPtbhpqMFl+Ij281TipZ6gNqchiZKMHLYo7YY5qA==@vger.kernel.org
X-Gm-Message-State: APuU4Z87Xu4FYz0n24a7SYWzMija/3p336EkWTnhB4Gr18VV9qzSsm/b
	4grtCoQKerSB7COdoksp15c3ZXdjXNSaom4EeHjkQ31J44pG1nNUeHM=
X-Gm-Gg: AZFdTZfOMMp8w/o8W7hj3hW8GNMASZeCuwGeungrKepXAEmf2pvwDU6t1dWSxPSKqU6
	gIkjaIaKn1guXP9/LeMufRDzVV5WyYJwMbYcd0eKj5T5ZgiEtYFOOArmLG4BIrEDOoHmfEBmFNe
	Yy1oS4E3fLn5pxY9KzVE31f92QYko65CEbgtydDoiHxsmOOGbz+E9qM1jfAW6Mdk/IBR0lw+4Js
	2uVgQ1Vji7l8nsy6gJ2b5ZikdfsQgqB6hj+QcD6nAs6KZBv7fGFh5OFAF3QIiopKTJaRDxIiRy5
	UBIDITB8tvyHFlj8kuEVUBkurJ+GmROzYMPrCCaAxS9pGaTwKVZ6YGh7KILNKOe0dOq0/3UttVK
	kQoaCSO5SebijzpPLbXSrsRhurVIlztEzZ2mzTpq48IuX4AMosrGCV24h41ezyn15HKdTXVPzXJ
	dqF+CdSFjlt1riwvvno1zhDc4n/uCVR/FKNViHFYAdcls0N0pSg3DdtYFogYqHgQWzVaj9YTgUU
	lZ5cDAKesW9kYoWOMc6dJv0iBqfRzGr7FVTneE1dQR1JDC7H45z7wyjUji6Tv1hBd0gLxJaYNJP
	ic9pr+UJTCpe8TU=
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr366049955e9.6.1795542389475;
        Tue, 24 Nov 2026 09:46:29 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm413261165e9.12.2026.11.24.09.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:46:29 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Jeff Chen <jeff.chen_1@nxp.com>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 1/3] wifi: mwifiex: validate TID in ADDBA response handler
Date: Tue, 24 Nov 2026 17:46:18 +0000
Message-ID: <20261124174620.1572200-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124174620.1572200-1-tristmd@gmail.com>
References: <20261124174620.1572200-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The TID value extracted from the Block Ack parameter set is a 4-bit
field (0-15), but aggr_prio_tbl[] has only MAX_NUM_TID (8) entries.
A value >= 8 causes an out-of-bounds array access.

Add a bounds check after extracting the TID.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Cc: stable@vger.kernel.org
Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/marvell/mwifiex/11n.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/11n.c b/drivers/net/wireless/marvell/mwifiex/11n.c
index cef8a55427dd0..7d249508e1a38 100644
--- a/drivers/net/wireless/marvell/mwifiex/11n.c
+++ b/drivers/net/wireless/marvell/mwifiex/11n.c
@@ -154,6 +154,12 @@ int mwifiex_ret_11n_addba_req(struct mwifiex_private *priv,
 	tid = (block_ack_param_set & IEEE80211_ADDBA_PARAM_TID_MASK)
 	       >> BLOCKACKPARAM_TID_POS;
 
+	if (tid >= MAX_NUM_TID) {
+		mwifiex_dbg(priv->adapter, ERROR,
+			    "ADDBA RSP: invalid tid %d\n", tid);
+		return -EINVAL;
+	}
+
 	tid_down = mwifiex_wmm_downgrade_tid(priv, tid);
 	ra_list = mwifiex_wmm_get_ralist_node(priv, tid_down, add_ba_rsp->
 		peer_mac_addr);
-- 
2.47.3

