Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795379995;
	b=ZbjpYCo4irTbY7qeEDhT/fYVMpmk1/HktXpuJXeS33U/C/C+HbfZ8E3yP4Q23UEFTvVC
	 H3z0st9Z1oaPGYTPhErvFUMZhh/xomj8hhg/1umMFqpAOTEQ6hWKqXghDlgJVhsI0US6m
	 WbeaZjAu+hIyUXzlwJj7gTr+eZFn6rqPVVP0zsFSUU5Bx3oZWji072LrASvJE+hv6K4nn
	 uifOMoJkfmXpPtwRrUhhC2ipU08/qEAgyveb7ukn3+LdIc556Ynz0OOXUU9z1a4dAMo9N
	 hrKJ72QAhF87MvG4bCqdhuDVvkTB25pgx/Yuwvt3s5/7JOutk91pjJbuAuPx6XM4ZYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kMg+zjgW2qcP+kPRWz/Nw5zZ3eqt0jtFvOR/PqTH4zY=;
	b=Zx0xMp46bOxwb3zuGFGuCZmH7roatQY3qEAosFaAqRofxhLYHx5GS31TpArnQXeYCH0L
	 tkC6b9S1XiYvxLK1+Cl8yJiLzDKANMjobPZNJL0ic+bKw00+4SB5o3qOwVeRvxlCCq6Qr
	 cp8lv//a6Y9Nqr0T1aSOWehJ8aCU9kq0qoQuVT7O1EVK4WMbZalwb9ZFeDnydBSRSVwuP
	 DM39l6ZjyIUJ97lxQ64mkv4OixK25wlnRMwwjjkFnONDV6+fM5RVm5LhWr8le7GcdJbQX
	 SgmDouI4VcooRXPDJ4CdkFi8Kv0K9+MSFXe1QPXUgT7DRYE+nr3ZRxIj3hW8Gy3QykQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Te2PsVIS;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDEC606A31A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 20:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDEC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Te2PsVIS
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ba380cd8dbso3329904a12.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795379993; x=1795984793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMg+zjgW2qcP+kPRWz/Nw5zZ3eqt0jtFvOR/PqTH4zY=;
        b=Te2PsVISJv273ZrwMl2S76o94mVWPimVWoFXrNq4K67N3sb5VypJMttaGmkTgYbeKM
         QbXEp2bX8B7X4Q8At6jdwR5tPoguG2DFUCZy/VUnASJg5V3XIgz4ZKVpYEy2SaZIdlwf
         IanWBAktgWMydRi4cjAV588Ep5jhV7XUpcK0vGDZTcux+GWGVkJLzLSxYOmpvk7i0TXH
         SFFTkM+4H7hgC0gwjKdxdwb4C/GE3zHcmiYG+F1+kCQ4IC9+53t0JTZKKRpnUp7LpBLq
         YHddD4q6QwKQ/O2Si67v5tFUFXuM3Hd6nkeuuC2VpRIBEFgXSuTuKOyhxR1Lvw1sUlpJ
         7rpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795379993; x=1795984793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kMg+zjgW2qcP+kPRWz/Nw5zZ3eqt0jtFvOR/PqTH4zY=;
        b=onxlRqnflY6Uboag6kG82xhqub1TVPeoZcjhFOKmFnA0Jr7R35biD5YpcPxTIAPwCq
         FhlQntthGms9AUETwGA7Q7YZQQG+c/hgLMnJWdLUiaYei9g7X77vLNxxtmRp3KWFFM9X
         Nt+Kof/E+0kdqklIVsM1pfBr07kFak199nDT42PMtL49dygCjtmDUA9yeDE+M8mvKyXJ
         Zsu1emPJ3lZNLsp0lfs7lQjF81XAKMAExXH48rMPP/IYTL83OP7HCv0Vh8KnM7egwIQA
         3dRS+lIiRAW0Zhp7EmzMqOwjFvjsMY/i37zJ3ifjRwMpD32DaJSlVZBExtMdbgqM69L2
         YNQA==
X-Forwarded-Encrypted: i=1; AL+hErFe4XXSeo0nmO+6CvxFx9jVPCcNvr89+NBNND3+ViDc2AFyh+SxWqZbEpo4svXzP684ivHsdtGFMo7sa8ZTkw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/v4HAVKzi/znxDocYuXBn5xQXYmRRu+jMKafCSBYjF1BdGiYx+
	Bd8+ZvLavYTjIdUO99VuQmMZFaNocI5mUkWAXm1YTWlwdPGvfrjJyZkWnMcOJr42pQ==
X-Gm-Gg: AZFdTZcxeFUVyY95WeV4HmJCEz6G2qKa9Pk1zhKP1rQTHDft3C4VXM9MKajHT15Rhji
	Wv0CYIvzW97R2ch5zSpXdsZ+SkloOIh8p3/wyvvSujsTvJzJSLKVi4P+1yaYwXr7V4eUWtbisrH
	CsloKISxNPYoMiX4D7QfVXbiYBTQoh2HsSAKABJ+IYNy2klCZlv+hxxnZfjf39dmDyrSws306uB
	P7BTKJgnJhmdhzWuskX79xkji8B1XO9P1VBXnTvwZvpkWPws1xQCsHIj4F1vb7C66SmN6WMvCVA
	zhyRzCcG02kYWXXsMImXRytjHv2Y+5Vgpaq+OQ2osBNR8C6eYWyVzercriV+lEUrSEZRjoFHzGC
	GQthtl2mS9zyElPrEOGJtCQOdO/8PRevQHsPZ4ADMwV8RpvHL+QPsF/nQg2VlkdVIO/MRYsiqSQ
	URH6/AXxQXmmy/QcObcmdoKlxQtZMw/iW1dblTe5KqtAwOkn/i5qlRu6OdWAbKsE8Fm3ZYXJXrX
	LrskQEpgQnt3thubbgKPyev3UOTsW8UdzvlPFNbL6KrmdAaiaJy+5Gr23Fa+QgRxWeszhewHD0s
	YM4YibRMkx7icJcVTKzMWJIp2Cu5++cZjh2DeXZ2mGVTMKsOUB1JvMB5smiGwJNX3RTXbInW650
	IqsFVJcYFYrpbc+MkD1B+sCum/mGk46urTrmaZbaVVCKi/FQ9VMqTDoD/HeYt+lRv4rMISI5NSK
	jk0w+uAMZ5c5lGdnbtjYlNlkxv/A65V1Soq/gPkxoEZ0rFWAhsaA+XR0zmLWOhwQLFU5HCkpDzz
	BTPlEeg1Ysb/8Lw3yvNQrSLCOwYAYYqNM26nE6zGzLpHVY2bzdfXmOsA5iTQZk3YKYNABEh7bAw
	aV8aQGqgWvrVVeyXaMiuuv1/noXUGRq00/GmQJV2FcDEI+DlAoMAZjdLcO0TNJyuOHbQ9RnOxzl
	r
X-Received: by 2002:a05:6402:1e8a:b0:6ba:b1fd:6e6e with SMTP id 4fb4d7f45d1cf-6bab1fd70a4mr818185a12.31.1795379993206;
        Sun, 22 Nov 2026 12:39:53 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713cc00a54ea2c7a4b07bd3.dip0.t-ipconnect.de. [2003:f2:4713:cc00:a54e:a2c7:a4b0:7bd3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm4295727a12.3.2026.11.22.12.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:39:51 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 0/2] wifi: ath11k/ath12k: apply the 160 MHz NSS ratio to the radio
Date: Sun, 22 Nov 2026 21:39:53 +0100
Message-ID: <20261122203953.1830745-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c1acfddb-2132-426f-9a23-472d8339dadd@oss.qualcomm.com>
References: <20261021165138.388593-1-julius@bairaktaris.de> <c1acfddb-2132-426f-9a23-472d8339dadd@oss.qualcomm.com>
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

On Tue, 27 Oct 2026 21:09:19 +0530, Rameshkumar Sundaram wrote:
> Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Jeff, the series still applies to ath-next 1983b40acfcb. Is anything
missing before it can be taken?

Julius
