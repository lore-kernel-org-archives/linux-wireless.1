Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607549;
	b=tEQgQgIA9bWWDJUuzN8StGwwnvGe4TMxyQ9MMqeUCW2lPIXBW/Cw7vURSFaI5q0xi73C
	 O77ooTntUBIKhKIVT0sh7EA/uKOQz7/Of+uxz6WBsae3spX/0A7cI4L1UDPjsg1KpahBK
	 DV8Z6ggqzIc84SqyGbCcPpQxgnyw0dQ3OH06iG9mZ0us9yXjcDeAWdIrnNT40d0JhXtXU
	 E9/Cnn1st7xtyzIqiL8hvQWBegJRym6/nDLQrwuvVgIpMWMm1XRkiCa1eNXvqWS/t6SDN
	 jg40AsZ/ZBx+vYdOSnFhRKcnd5UQMHDvozkub1vsE9iGk4VNEK+SsUbdsFifQh2UeLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UuCcRaWcfhI534qP5WKzVNn48w3a+JItDciIOEIM+EM=;
	b=vh0VHaVoYTNtHQboFWTAlawNIZMMz2FVG+3rZXn9Nfib87+qTR20gie/mLE+B04qhpNS
	 Gsa668X5vjPpwq88NnIbr1YEYyhW5psHMzx40Ib/klKv6MzvO+7PFRE9Cn90Wk0Lp98gE
	 FtoyGzmF7AmVShSghCIXlScGuHc93SyHGV44IMl1Hb2dPPcgLsgBhH+ti3CFMR0dfdZiX
	 TzxJt1bvlI/16TlT9ttF+9sUkzhEeAY0N19fnj+I4yttpmVewhXNac3MI+2LahopB+QDy
	 KXvOUjQNSP9mYdi6iWAc6wyBD/71ykeUBMJiMlUb/qP5OWRWTD9FXTk8kZZmFbL0ZvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7fUvc7B;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E70606A33A
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 22:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E70606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7fUvc7B
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so22099585e9.3
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794607548; x=1795212348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuCcRaWcfhI534qP5WKzVNn48w3a+JItDciIOEIM+EM=;
        b=Q7fUvc7B+KCjlLEbd7LBof097PJOOZomD59SknDaa6DwF/nygvds24aEOnwTzjBnuN
         /MmbOZj2ihnF2jFoQJE4K1RNA2dcpUV2Szu0keHR1S0+hdypRBTdmnQdAVej53mX6MMd
         A8hpcn+4MVafT7vGDBfTM/Xkrlhb+1XR1yFU2e5T0prRvogpF6aecWknnJD3yvzUn4Ex
         IPu4HB9ZkQXsOh/DVyxOPMWtFUQYYOTdcPyDqsgWJumIFBPGkQuVj/jJSEjEajM7bw3V
         gLtsDSuDXyON1GYnI0CNZoC0pS1vqVZ6USfp+/Zh9S09a5pEmgMxWcTEGmnwmoLNF3kF
         Pz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794607548; x=1795212348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuCcRaWcfhI534qP5WKzVNn48w3a+JItDciIOEIM+EM=;
        b=MxIfNWI246hKIQbgQl8spoCaJ1ZfuCyVoO+DTSX+9GBDbo2E3JbY5d972HXB4tk3h+
         K+tJB/fWyFEgdGR6Gx7XyzI6N1ObFgRT1/W3hmJxtbr1nSgedqi8tG9bR8fxDakXbUzC
         99e7ckvK0Y8YKC2TWsHJ158At3RiRJiUdwDrNn3Tb0vzcMDI/Bj4K9Qdr3l1i9stP90Z
         fXLzpDqNbQxmbiclJYKlNtXEoJ3kcQ4/oU3KawwNg0kFNB0eY4bvR+wUfLzhLYE5umzc
         3ARNsKi61ba0xk1FqvjdFQ1qxDs/A5KoHqEU5rD/0cg+l6iFZqlagOFkYkytPcPlbr/I
         iwkA==
X-Forwarded-Encrypted: i=1; AL+hErGpwztucsqBHFm5P4KwF9MEZD9WxSPplktXmzNcz10HdExGY5T5c7cVwXkKYg/BocR1dIAfYsXYO7nEsIpfzQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+EOZnbHEv5o8KcHfMauHFnraM0dNDZSWRiczMZCZXUs7Hbr+ac
	dsF8hMbRV2kHvjeiSJmJHUsn3ynBl9/NOZDIX3D90htVLuOlMn15HFq4
X-Gm-Gg: AYBFou2TgdttIunjfriLIzgZ4gQwSHRD1wmRvCqbJEZ/ie08UvIFRoJy0+ni5U5JsMU
	Io8DXpzJkpzaHILCdJvZ1LPwkps9f3JWd71/du+1/kwM5SOvUVqpOr3b4+cooDPbYJC0XbAO2d/
	M5WFrT3hk0w1ZCL5Lnsc+2joGwmP7sVL5nIWhuCprN4sBhcOVKSBnl/7hBwdRzVt3JXHD9ewazz
	FSCnv4OlIm1ChSjDCS13J/7dWOD6UID53L9pykf4i9USFPf7gAGnRHvqSPECw0DtvAq7MRvjt0g
	ZxkijGt26J9NfbJEPTQougqvUnLpbkY3lnnwv2chp1ZqW1owBGh7TEUzs9OOoi3tOc/SiVnB89g
	st8fkpPJJrr9RJxXrwZgLOa6wf4olvT0W+JYlb4Z18244B55t78b9m38wPIEu+diMrrH0m1UHeQ
	sFv31KvOX/b5wQFWXKsn64kdBfLWsq6+fFUXfYVQV65VLPvhjIMjI3bVFLxdegOSGf56rq/6Xjm
	XjptgXRFuRBtoTy5dnF34McN+MSkISUyjuvVlfzWFm8+09cIsJB0zTrEym4H/YI/RPSEVRhw/vT
	D3iBdTXC3BFWwINVqII8SFI/qgl/xRGhdSwM
X-Received: by 2002:a05:600c:470a:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4bb5599b358mr83112735e9.0.1794607547553;
        Fri, 13 Nov 2026 14:05:47 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a0ffcdsm87834915e9.0.2026.11.13.14.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:05:47 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v10 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Fri, 13 Nov 2026 23:05:46 +0100
Message-ID: <20261113220546.826710-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <1D396970-35B7-4B0B-82E9-24B523AD69C2@linux.dev>
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

Hi Luka,

Thanks for the review.

> Could you check the beacon spacing in a capture with beacon_int=200? If
> it stays at 100 TU, that is a separate bug. Would you be willing to send
> a fix for that too?

You are right. With beacon_int 200 and 50 in hostapd, the beacons of an
RTL8822CE, RTL8822CU, RTL8822BU and RTL8821CU stay 102.4 ms apart on
the air, while the beacon interval field in them says 200 and 50. The
register reads 0x00640064 in every case. I will send a fix for it as a
separate patch.

> rtw88 sets BIT_DIS_TSF_UDT for AP and IBSS and has no reset_tsf op, so I
> think this mostly catches a download that ran more than a beacon
> interval late, not a TSF jump. Maybe say that in the comment?
>
> The start case computes the same next TBTT, so it could share this
> branch:

Yes to both. I will reword the comment and let the start case share
the branch in v11.

Best regards,
Mehmet
