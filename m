Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162542;
	b=nLXvq32B3vFpkQifp0k3/bxuTRuqfUY0cugJ7V/4QKopu5HrF4SU/AuZEnaMez27d5n9
	 UCVDh4xCa4x9F4N4NRFbLnbSbuY48b4ZosvVAyXNA1r+gVuCry9R3l8kCxapJIw+LMEMo
	 UoYJvETjKlVCaaH0SjpSy0P1UkJwOmvPz1knUNE1dI50BNHR1VxKN2Hmuvj0bk9t8O1Ps
	 ICl7BKEfZzJHE/hwHqukOESXVuCH/1ymOGaf5s4ur4vZR1aeNAascwCiZrPR46E2V+5fv
	 6tlPZ4AwV8Cn3uUk5+EpSJW4XHbs5GGRhE+dPFopp4wrENq83C/U1LicvDYpKvZr0pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aE8fsj1NIaKRva+QOmPHFRmITtv9VE51RjmDOs+p9WA=;
	b=zBUKzxuwUuMawOzy6zafQa4oERyUfDZv72rdMD3DgjJfLsYb0EWvr9XDDavU+Rqr8l9c
	 D7Kj/EX4Z8vdmP8Wn1bw2YVBYp+YswNKHz1Ogw8CcA7NMOWhIuoUMpb6MaKGxpewXRAuZ
	 4tqhWEGETr7/2FHUIjzbRXvD4KWl+avAJblQX7kef/2d+zVEyzRykHPejykqf/AxojARU
	 EPBhYayqAn4YbD/60TWxwDGkfxn0D4dY0t82fVoMbgurj0dQGbTlgaKseK5Wf/G0YJToS
	 kkqpauZVH4S+uFTkmGdjdRFbb59vwqpqQ0AvGO3lFInSj2hS9PxMAPFUVymqZRLFw8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j3B/Ou3N";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2806E606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 18:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2806E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3B/Ou3N
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd69954c755so111756a12.3
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 10:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162541; x=1794767341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aE8fsj1NIaKRva+QOmPHFRmITtv9VE51RjmDOs+p9WA=;
        b=j3B/Ou3NGC3oovPaAENOTC40CRU9zYt1RQilGxXqeMdF2vcZeZqdARzdvf3wrjYqLn
         1k9QSImG0K4GqKkxiGUmM5zrIFEclrqCpuKkLCjypvktUTLjSdYPPupirHZ9URvc1uLx
         qSWqJxEEH4/CHkCi04YwBmMW1JcbrqnHUWoJ8wy/G0gSaF27hEeUEdiQCMs15B/BgTfo
         3lmzKbJpqPKftvYXI/gCbo/ekYrN6fMQ+hhAIQg/0QOidXmOU4KpbJ9E6npG2d+7H5Ei
         m/T7K1TMTSbSBiNVABX0B+bby35Qrtc45UfZJvCEG5Pbo57JL4PxmulpsoRCCMKxTXfV
         anrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162541; x=1794767341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aE8fsj1NIaKRva+QOmPHFRmITtv9VE51RjmDOs+p9WA=;
        b=b2uflzPslA5+izc11pfvRcaaLySp85mP+G9xhB3xnevrZ8SvNj/LyMQ8cd/vApRWck
         MarL80BWlnggO9PXcTPgTPAo1O4bEVqiTarPynv4wsABYJB80Lti+L+sInI0pmxW25AZ
         v4UWJTjpeDb3GUTPUoCg5ATOZhmQMEBsSfT54io0bIAGZihAp6Gvng+5zx0WZRtmJ0Fz
         Fz/VEDH8C/lHJizLr1hczIyiCfnW4kJ6bLQHMZ5aVNPVn5a1ep+VVqN7seteWySqYwKe
         AmYPSYqBs6ufetbHJsgJw282tJwpQKlMj/yNL2FBLI+Mgos2WomD5dyR/9dytLohypGn
         Z7iw==
X-Gm-Message-State: APuU4Z9YNGwo0v//A8wQeJnz3GI2m1CDDPPU0QdPGvTLirlKUitrkW7j
	tORhOdwm8Nt9mZGAaTRPYaWeyY/msFIoLjNfQb9xkAwDcsFy/hY2iwJ5B6AApAzR
X-Gm-Gg: AYBFou0w7ulctleUHh2dh7BHDdnh4tcHnT8V6rO8rs3KgPK0zHb7VMt5KYPifkbT0/L
	gomKs2Yp7vYzx8OwQCIhAxdXQypxn7kKVhYoFAsfp6LlLam7xLIdzjb+G3o/NKc/Qv+G4KE5ePu
	APzLmTQLCOUuToBSw09XL2rNsA9LqmBSCMJ3GYXHojz6K37FPw3AjL38Xxqb2FSehmVY66wXwta
	F5toWLvzb4v4Ko6vCdzonqgTKQD66GPe5FInliFZXXCX0t05d1v/icF59ix0U3f5tbv9qvAOWU0
	DovVPoTTR7Kweg4iPuGIrAYlr2k/A/rftwbvfQ47lFNGOtD1m/SWVdIZpK8cTvyTQqOxAgnG7oW
	8ZFotwCDI99hR5DF3XdFLfWzsZfF0syQ6LlALkt1YCZuIVUPanOhG27WUDVL07dAPSvjFJrTBQV
	1rGtPKQJYOzRaeB9tCGjsd0P73YannQLSo/WCJx7/mRPDtOCw6k0/NlAF+1CuWr3coQhk10vcge
	AdkQoZ6UJdsI6hlmazEfpcMbNHOSwR1lWi+y7bFwJdXnKmMgU32L5CAZHyfsicB8EVkVkpJBvlM
	DNmKPAPlaYdxKJQEtfPyEw6hThwlapD0OV76qUbClV9mCZumfeUHT+DRoZTg81Nn+7nfTV59TbZ
	OM/SxpxXhr1YtiWj3kRjnfHAyxWYYRQ==
X-Received: by 2002:a05:6a21:3d83:b0:3e2:8f64:e4ff with SMTP id adf61e73a8af0-3eed3c67fb9mr1458487637.31.1794162541173;
        Sun, 08 Nov 2026 10:29:01 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:9:5496:ab84:534b:ad67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b6498209a5sm692938b3a.36.2026.11.08.10.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:29:00 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH RESEND rtw-next v2 0/2] wifi: rtw88: 8822c: check register values in cck_pd_set
Date: Mon,  9 Nov 2026 00:28:35 +0600
Message-ID: <20261108182837.682661-1-zeshanahmednobin@gmail.com>
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

rtw8822c_phy_cck_pd_set() indexes its tables with two values read from
the chip, bw and nrx, without checking them first. When the chip stops
responding, both can be out of range. Patch 1 handles bw, which goes out
of range when an RTL8822CE drops off the PCIe bus. Patch 2 handles nrx,
which Luka Gejak found while reviewing v1.

v2:
- Patch 1: move the test data below the --- line (Luka)
- Patch 1: use the preferred multi-line comment style (Luka)
- Patch 1: drop the nrx check, which can never be true (Luka)
- Patch 2: new

v1: https://lore.kernel.org/linux-wireless/20261105113415.73184-1-zeshanahmednobin@gmail.com/

AI assistance: I asked an AI coding assistant to help find out why the
RTL8822CE in my laptop keeps failing. It analyzed the kernel logs and
found the bw bug (Luka found the nrx one), wrote both fixes, the
debug-only changes used for testing, and the messages. I reviewed
everything and ran the tests described in each patch before sending.

Zeshan Ahmed Nobin (2):
  wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
  wifi: rtw88: 8822c: ignore nrx values without CCK PD registers

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)


base-commit: dc16902cad9c6b08df9395a510c7be44fbab545d
-- 
2.43.0

