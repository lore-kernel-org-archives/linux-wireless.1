Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794076499;
	b=ZRKrgK/syDHYI2oWspFQA9zr6pSUk4hVED0sn/Jey7rR5IXP50jr9Ak6nGI3H0V+x5tv
	 Gdn+Sa/oDYVadt7A79HGlnFX53MURLR4zH8D/0wGMybo3N2IpG58HMIP6NrYsoHsyiaA8
	 CCPa6VLZ5gCvV+WhZqKnUxhDRolsG0vt3Jpi3pgns+iOC+hEIw7Pu4wmO3/Nq1kI3WoC0
	 0cKuslkZLL9S0+RSAZsQpwECuVpn/5ddeyP9iJageBWsLLvVYX+IHvtSqzfPU2zWnSC7N
	 2Vsgq+Rdf/wjqLB3TVqNtw5bBVlTjEr8J3yenBshWPvRA2DL4zjUtNDpIS8Tg3ke7Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794076499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aE8fsj1NIaKRva+QOmPHFRmITtv9VE51RjmDOs+p9WA=;
	b=lDh+PvDF4CWMNzOTjWz7I0fN/ZxFvq2WOK3VJKeffZ1P77yfWVz0r8RZNK/k3zFvI5DY
	 V+jmE5ePj/LKEMo1iM4MXk3vc7HxV/CepNgM++aA0DiegO4/jk1sAMfWBldHYe4OJO2Rn
	 4Y7u61e54OW44C0/v6WglTW0PLjJaDWnqg7f2dxq0JvrrKo0Krt1DENZgZlLEcp4E/tbr
	 5Ps8kJpeJZdAfrg/1bjUKo/EFPNdiP5Nb+D33BbZgdhFazH55prjZ5jsr6Q95RDnH2Mr4
	 UlQ5PVLyMdPD4i1Zuf4s+dSwWlKl1LBF8o1sbRYSTXiezYLGyqk1x81bgiw8LQ4j1gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DB7IwkAb;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406AD606A326
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 18:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406AD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DB7IwkAb
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so665550b3a.2
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 10:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794076498; x=1794681298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aE8fsj1NIaKRva+QOmPHFRmITtv9VE51RjmDOs+p9WA=;
        b=DB7IwkAbSLfZxfGS4ZztULx3/JZIeEUqasUPi25MjwL5eoDu6c+HrgkNl61J78oRh+
         k7vsBATDn53IivHvHS3Axgmer6TtAwTqHxwDU4frodvZm2ZplsI1bfwPBynWK/78C463
         X0CmNJk8+ozBIDtqA7etSasHKEQmo+PQ/TlpoJClaC1yZUNwn0/JxZGK0xRs6bnRbUcr
         Ztia9W9ZI+npNIuX4VAHc9FVLAqlR1gOY6uq7SD7zxm2Tg8MVJTFK62rtU+YvVO7As9j
         CO9gJzgk25nvIKKBdwLa9HJOG+5xCq32bpUgd6DiJSjgvDpan+y/gt29y3t2w6SVpj/x
         HkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794076499; x=1794681299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aE8fsj1NIaKRva+QOmPHFRmITtv9VE51RjmDOs+p9WA=;
        b=N4270NzJDA7SWrEuW1bCEAqepmZnnM3FdEL1NmPM8B5Yvz/fNiiVW3e5YgJS9PY8wM
         d3mLlvOu5FLf06t8ArTyHTx6WIqbpStoNn+jFh8lGYu729rOKG69geAc/Gzl+3CJcSVX
         /If8oY5wYBe+kfqwHuXyTYVzYkg0rB7iSR4cNnYOK/e0YgDuxKcDqFNUyd4VTyP+b17S
         7CMKoHqJVVxmNZkRHCQC2/E6NC+iiyo4mjorJcriU0K4UcCkpVlKuO0/dgZJh3KyVGk7
         e8bFHvhzI78aMfA2z3FZskUELG8Et02p0RK4qwr4dFCjG9f0BxxFlr5eXVyE9UTb4/iW
         pRzQ==
X-Gm-Message-State: APuU4Z/T4DXHQwxdz7c5yQMneBj0E6zNHGLNzPl5uOvvzEdzHDoj6IDt
	0tBgmGXCZqvvuUbVOlWGHxIbccIrHEJz7OrUs9j0MTSxrGpAvjGMwi1cY2tDhfcI
X-Gm-Gg: AYBFou2ll/2HRgQW3KvLqkF8gFGTbZ5p/6dIUvdjHtYisquwG+KgGxDUe43jZ8Ypvkj
	IYoHiq5Ha/qtkY2NdwqnfCNEwzjG8IYQxawe8KT0Nrtz8raJ+ZEkDBJWWjKYYwhx7paXCaj765F
	LuiVkugxYw5GfdUioR1d7NUJx0M3Ij1O3oUWd7y5omE4ycTWDcBf888PcAmzxk8LgN6/rlu/LWp
	eDvbaDHP1KOAhqQE9daJp9EOZa98jYqam5RGwiaxoVkeKhDhxMefuFF6GjWkXOPsyl1wSkrW50t
	b+pRnG756kzqyg5gueXwnDAEFs0Gt1j/U1C0NbtESaGt7UKvzFjKf/I7qz/gJM8XIx4eS3keshW
	lzuPITquQUEnB4tjAbKgv1SHuagIngFL2BQpvudD4ocWRFZ5C2DnZwlS3NaF6aeb46w9PT2i4+d
	3vFGPRCQeNXGLMVPqzjJCyggL7TQHSrv1EkB1q9EuYcP0HsbQKhIBsMvhvSk7hG/aLeYgl3JoWK
	3wcRPSUL4OfuhTyIhmJ8FAaBxXPGPctCww+ijZMqBtgOd+o4+Qs/UTTiQ7dCysGa+MxzWhtpA5/
	0IGGuO7ecRxgJN2UjFkFWhXMIxQOeLH6+AtfOHmewU71pnGMV1H48ZKMfPhMsl90r91B7XO6PKl
	YvtzQ0bVFNODSEdJUEiFcJM248x8WWQ==
X-Received: by 2002:a05:6a21:ed0d:b0:3e2:96a4:7b07 with SMTP id adf61e73a8af0-3ebb2acad51mr6073377637.87.1794076498442;
        Sat, 07 Nov 2026 10:34:58 -0800 (PST)
Received: from localhost.localdomain ([59.153.103.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35921db07sm1332019b3a.15.2026.11.07.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:34:58 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH rtw-next v2 0/2] wifi: rtw88: 8822c: check register values in cck_pd_set
Date: Sun,  8 Nov 2026 00:34:01 +0600
Message-ID: <20261107183403.50696-1-zeshanahmednobin@gmail.com>
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

