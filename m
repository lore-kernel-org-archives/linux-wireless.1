Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957362;
	b=qtxL3bv/Ghs3/SHYKg7Z0jIqpfghy+0V7r2VlFwGmSEiVxc+GLdBh79xl0cB6Zm3t5tE
	 zi8/sLREBhXEXEve7b59YR2bdMZ5GYYpzaXfAXic4wq7E0C7FU23h/kirSegO/XupPQrc
	 kuy/izTeYuGu63iC7riQaE05oAKbYwl1QG28ruWrY+h6alh2hKgG8IRS+U1JqQPU40bma
	 MwdN6q6rdevcNQFL1+AhKdnmg0q7loPVc9G0DNRI27KYeCpRKup6I6DE/8llRIEJtM1tV
	 LEcQetOEzvh3kYg/lS0U3We4bSt9LXwpqzYxXiqLBnwUplmUoLeMmZDHmuU2yZp2qmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TRMivUc7hqRTQvc/18oEojYCHTXC58DX0V1KO98MI2M=;
	b=novNx2p5IA39/BR7z+zVmRqMIf8kY8I0dBZ56ubkOlgE4clQ2H1PX4uHTgAIaAKSmtEw
	 p7GiB4GcPaqthPMObSxxWSfMsCZnZSmaT4RmZepRLXx3IChFC9TnHCV0iqbFh1Q64JUv3
	 CeYSyoWQeBuA4NhPMeMr5yeClwsGXgLV9dXEJLTiLBNoqSUZkCREOFeBrAkRYuhfrZH6c
	 Il1SawJua0NOpLLL+m+qe7kPmKazA6H7o+k8ks1SohigOudzq7RH4+wfxIAM6LxX4Ljdj
	 muaqueXkOIinScc1vw9/lgJG0irgvCWIahDkZG4thUT35cAIyro0vxaRvcm95Z5dZeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDtAapon;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851B7606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 23:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 851B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDtAapon
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso144249f8f.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 15:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794957361; x=1795562161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRMivUc7hqRTQvc/18oEojYCHTXC58DX0V1KO98MI2M=;
        b=HDtAaponU8iuheZxm0TK7UlnWpKKIanDuRpm0K8iUXODXFC8oB08VgdY389dtRDVty
         svj7S8QmFk5Elu1RhzPifKl9nKShjuDPiISTs4ZHt0h+esp/uvImwBOSz1kw2rCYVh0w
         /STHo0/fUPsbrGLgiBUVb0uiH1SIbymyr3RmRfWtBKEfxLgy9dCElp/JZ9oiL6PHrOVk
         sDJXXDHF9wV1+ZRIQA/CW9D6iNRj0QUQKa3Enon2qqaT8/RqWJhk6PnpronAxv6Yupl9
         nWtq/RDCEoiqyGmWL/AZP4PSijS9sxBNAkwnO78faFg57Ra8vnieP4pY+GH44uR3aaDl
         XD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794957361; x=1795562161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TRMivUc7hqRTQvc/18oEojYCHTXC58DX0V1KO98MI2M=;
        b=R9z7qrdMl5T0TRVCZjxf6LvTpCrQ/0wEzWFVCYB6En4gbWYKZ1iJwjR8zKJGvX9exE
         WMwe2crtw/+UuDYlv2JdyB1C3E+E4uqpYGSF9QDKl33hvlOEnSeB8P5wl+L/XSdyhcmP
         eAS1cW3anaHTTxGqEMRkgdGlyC3iqCRNYymW58ZwdP+p+hYAT+rPkor7x2+n112hUnba
         ybI2nLmhTEwnzhxXJ8/nOLlMauaYOLtYVlxt5DPBEJcCSWJbJcSXycYA1yb3hMi888x2
         Bvc920a+sAZxjvStjSDwkeiu+IVos4ZsZsQX+SO4Fe8WG1ygETT5RqSWWt590UTFzqgM
         sTpA==
X-Forwarded-Encrypted: i=1; AL+hErFlXkuxmYBh9AqTnz1YYK/EyLtCUMnxhDoAZmg2rC/EcUArR/wIf68T5r4tPtmpf4hbTld+JkkSZOOQww3LNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vYc4Qq93RYIlmFgT5hqQKdLKdNQTHXyphr2SQ1AZ58NK7DgJM
	jXmJSHA2OcMXxZ30P8UUSmcahi6Bpnuql7aD1HavZ/kNhDJ8yFEgi70G
X-Gm-Gg: AYBFou2uxeKr2mn4Kva/e8HQ/2CvQ4O4dPOCzjvQuTTOXd99Lf5VAzmhXG9ooHnACNp
	rcBzNG6RYC92dyAPF2OpJadBcdfvzX0z0G2fGfG3+4yhPB7WM+Qi+cFINFlKiYq/X7LWBRpV35J
	G187S8CuEiNWm1aGIin0qqLrOtupsINrc39//PKLmHLzJHvnhV6gsespF+3XQLqJPC1aBcCnyF9
	uyLKC5af+oQUbgDfylixEj10g4G2m7CFsoug2j1Atk4QGcMCMvVOhQFRSrsAMfxgJLIiJSNd9sP
	vE2YU7/zaHg/+pvuPNMRfjTMCTt+ahZvWQKil83O70AelkveTkwsZYF0FOuXRzyexSUxRiJ8aPQ
	S4fINonSZ3ySpvfGoORHaJtZbhZTT22N7wWpkqYgcCRJvAWOwuyiPvGzZNu6FJ8oklmaKlgBfLA
	SEfC7dl+e2KjORC6U2OnXdFN7fcPca7aYu3czmcd9PmWOy+M/Q+FkQ2Z4fvulWaMJQGMkCRX1n0
	2w6zB/meA8VkhWeJTUVzqDZ8Db0U5ypigqCXS330gt04R+lSdFlIvO8abNJ+5cjxb5qnHZ23eZI
	MaKnnWq6XBGxLlQ0Hj4IBHD/TXMKRP+lEUo=
X-Received: by 2002:a05:600c:1f84:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb7da236c3mr12822715e9.24.1794957360715;
        Tue, 17 Nov 2026 15:16:00 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4f5b87sm11533105e9.2.2026.11.17.15.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:16:00 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 5/5] wifi: rtw88: clear the restart flag when the device is stopped
Date: Wed, 18 Nov 2026 00:15:58 +0100
Message-ID: <20261117231558.1952531-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117171003.1840491-6-mehmet.fide@gmail.com>
References: 
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

Hi Ping-Ke,

Commit 3f2238709f5d ("wifi: rtw88: clear RTW_FLAG_RESTARTING on stop
and start failure") in rtw-next fixes the same case, so please drop
this one. Patches 1-4 apply to rtw-next as they are.

Mehmet
