Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542391;
	b=Jf6TpOHMbklmctHM/waCxcRw2hArWwaFMFtcCOuJagH/dHl6vQb4BcdhcCUHIcJTDLI8
	 YDB7MWjb3iOAA7r7MMgk/QpNL/U2OfEs/IG+myaJmu8nksqOhuN+1WXmwywEDmI+/MtO8
	 bXUnI78iDEWLlFrWs1Hh6re+sN3Sa3nxI/hG55UiZA90oLYxzDZ/refAPqhH2j6syHgKy
	 Q7kXUzwOqg1/jRNZ05BPxTfpMTa/ugdeXjpjStfoB6HQMEu1MYqnGzVP9Ept48T7ZlcS7
	 jmOgsulorV+PgjNlfmkp+bmKYLknOreoRP+M4BULig87intgTfmD0nVt2HWEY7n7TUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AZ3m4IXRO0daintvIWIx4Ztq4eIIYHiwztaanniHigY=;
	b=ozjiiSnBR53w03a9KbfRDGed5hNSI+FdIIxaWUZdZuB+wa9GSrBVSzolMCqUaGFleqsL
	 vnEyfoBx0F4mEmT+jdOCV/EcmE38tggMmv3ELK4svnUa1KipuLUkT6E8wCBV4RsjpzArN
	 SZQ/I6y5jIC5+4BC2onSxJmNoiAJFw95og9Q/iStii1Z3sKzE1ZILeTvjN4jF0xNyIo6W
	 cGgHkoHOLTB+jY68hZqQlR95VD/dk21w2o4cPp2620mWY+wI6nxeb2t19H6A/gS0KTzUf
	 KMoIqGE5ZpO8+559MFdocqYrWy/EwSq8gS31XiRCayYllnKt/DWmOzs7zk4ysoEW+Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTS0tIiE;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA4D606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 17:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA4D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTS0tIiE
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so62752235e9.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795542389; x=1796147189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZ3m4IXRO0daintvIWIx4Ztq4eIIYHiwztaanniHigY=;
        b=CTS0tIiEPYrstz/vo4sAsctLwS7uUMOWM8Qa20/yOPjzguFXm6lOeSDZwwBUP9cr0T
         ZogE+jFrzDbzV+pW3fHnxAfRPisDT8pO7IuAgMMSU0NuPTjlHueeRp/WClFEgXhUffT8
         v1rs3okgddoD9vBmIbzNmycLyWpbIXcd50+0+GaL7V3Q8MKnfxBWcd7fvitsEypgHsQz
         SZL/hG8IBnb2HucdeBpgQfQmuGuAT5tdFy+hCGGiIVqEBO4znaiITBm0NtfWjTPtVI5s
         M8g4ez7dfmApI2ucdybwvVWOd9/NrYOiyEiy1+V4LVAU3fB8ibc89pbBVnWrPRNT/1gG
         F8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542389; x=1796147189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZ3m4IXRO0daintvIWIx4Ztq4eIIYHiwztaanniHigY=;
        b=FDiOJuJ98KHSco893gSgxZH39YIKai0FEifLHFyz4O5xen2SL7yDB4xcS/5knIy/5U
         F/feh336KU1Z4MkQKQbOnBCAdqdsPR20Rv11mrpPEA8B5oGdzYoZuuPM0oTwBz+aRwHE
         K41KtcCBKc9G2a8I5ROWYuNMf8Qcn6WjGMB0NmrLB5ZA+1uGsWlDw7lJUvwn7zVDKhN6
         FW7pBnS43JpJqIXxmU6mh4DAAxouHsd3StRNZB+PS3lSvhxQygEQIEWTjSxw6dfcA0aP
         45Hxb9Gba+7/ggPG6b0tfZSvDqCUnGC3zxdptxjqQSDrom9hidJFDhIoxYF818czBNkm
         xVzw==
X-Forwarded-Encrypted: i=1; AL+hErFKz3vAZfazXdSgNDsRpulH2nxezWx1do31CxWc21fBH0V1QIbxix1ubV0aLeV2nsITcni7Dbu2XpN9rueYQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8AR6T1nnjcAgdlfsY6S9Lc5Jjs7KDzIcq6hAlPyd2hj98++D0y
	x+9MmeDWhhb4JY+ko4vNV4DjVxP0SpbC6/jicQcficfdk+TJrbUH0zA=
X-Gm-Gg: AZFdTZcIm1J+8bn2bcz0RKFv9BaxiLwhE93ghxHApw5OlM6g54aes8HZF9lB/kvrZfj
	vKqJbqXSxmFvbxHz/k9+0KIOty+fEDJZzDcAENS3LH/WAll+WwSYs6RTc4OxRpk9uQBCWJWymMd
	f2HZS6HeC7KBFcVNx3heQU2YlyIrQ5wl+jtOfJT8zf08BXtwxPojLcXBFG6BX/JJrGQofXkZiWF
	dNsCyGh6AAY6gPiiVcybO0fbdx3Al2xHyS3IA0LT5W6mlva1gSz5hhA5Q8+HCLH7G4wK5Pnj7JY
	2/qsPzweWo4wmF0GRrY4jJAlrBQaqmOK1jU2VPP4Oad9xSFbmV0VnnRDSGfu9pZcG5ZOhn+yHzS
	Yjh+Dr1ieVEmf0m1aaEQXH70O5xAoa2shquC2zwahIKejq9alARNLFePRH9xrfBGQRuFxMuZBV4
	Xsa9afKCSsRdu+UA4wLZ0c61gmUCnzYobWtK9od5FR0c0KBQzl58zwqbP9FN8YgTQGEoKc/7zbo
	c+oP3GDL31BT3IQQKZNMAtGl6qHMrnokm7qWxNJSmivTC+wQCiI42SqgIdTfdxwdBdFIVp4DgKx
	/YoKIomeqcRA0pgp0U2vne7CBUoubBh4HYrs
X-Received: by 2002:a05:600c:b8a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb88818156mr312370375e9.16.1795542389016;
        Tue, 24 Nov 2026 09:46:29 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm413261165e9.12.2026.11.24.09.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:46:28 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Jeff Chen <jeff.chen_1@nxp.com>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 0/3] wifi: mwifiex: fix three firmware-triggered validation issues
Date: Tue, 24 Nov 2026 17:46:17 +0000
Message-ID: <20261124174620.1572200-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Three validation fixes for firmware-provided data in mwifiex:

Patch 1 bounds-checks the TID extracted from ADDBA responses before
indexing aggr_prio_tbl[].

Patch 2 validates intf_num in multichannel group info TLVs against
the available TLV data length.

Patch 3 caps the TLV-derived length in IBSS connected events at the
remaining event buffer size, with an additional guard against
unsigned underflow when the fixed-size header advance overshoots
the buffer.

v2:
  - Patch 3: add underflow guard before computing remaining length,
    as pointed out by Jeff Chen: when the header advance overshoots
    the buffer, the unsigned subtraction wraps (Jeff Chen)

Tristan Madani (3):
  wifi: mwifiex: validate TID in ADDBA response handler
  wifi: mwifiex: validate intf_num in multichannel event handler
  wifi: mwifiex: cap TLV length in IBSS connected event handler

 drivers/net/wireless/marvell/mwifiex/11n.c       | 6 ++++++
 drivers/net/wireless/marvell/mwifiex/sta_event.c | 8 ++++++++
 2 files changed, 14 insertions(+)

-- 
2.47.3

