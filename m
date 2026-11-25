Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626869;
	b=COBs618JM3YOzB2iGH040wz1yYnZk3KX01wjqypiB5uiPScB1HvGd9U+ByjipaWjeOM7
	 bc/Wx77ODxFoMyLsBU5gj1748BXaGmcfaHFfuIjwugRGLXZS+itQWECSl63Nz46kBNwlT
	 PxDMX79hUd4lnMYeJcgDKI1MRKeP7d6ryO7lfK4ELA+XcRia1uOwxIuXPp9F202+XiHhw
	 xMmNefL/nMLkIOtlLdLlQ71r3rYlsAszAN5vjqO6uAl7Trh8BGcUC3HDF3jjMEA+nxl6C
	 vpgr9c4rRh6oKEAqa9OI1dOZnHGp2wDa7d8sUyfGHGC/yvgfJngj2YYALy7cPGsoyuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=e41widtp5DMmdFFeX2AWf3mpay/8eXwXnXNPU/S4dOI=;
	b=5GjZ3F8Oz9wwAtVW4+xi65XL78K3jnCzTB5rBXtUqzpDlyekl88MYuocTrYFDVJcI44o
	 mll1IJkDPG/jIhicUuimbVnt1YPt9kJ5J8nfG+PqTBDcMD2VGEcGh3bfv/XHyG8xRmLvo
	 feJi5INsvNGc37XbDI1KHqBhbe851ddFuc2KGeMVO6/uVnkE2+/bnxXn5fUWfwnhtXvwv
	 NkEsfAtPeugVvyC2HlCYZP9XFKauxc8mvzR4cq7++kpfZ4HIQN3/4sV1a5sam6j/qy5Kt
	 jmJNFoO7+wVHbDXrhGJoq4ZMEjhV0Nz3gkebOTKU2DxVjTEX1AKy2AEke2dgzb0xAhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cpqd1Fhd;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931BF606A323
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 931BF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cpqd1Fhd
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so3555724f8f.3
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 09:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795626868; x=1796231668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e41widtp5DMmdFFeX2AWf3mpay/8eXwXnXNPU/S4dOI=;
        b=cpqd1Fhd0iLCuRWp2NcwkdW35Hhyb67oS243Wo5CL+D7EpVLQNMjTkNxQZzEzD+mWc
         t/H1D9bV/+SjDhFI/hdSBf9hZ6XtVl3VFpxHamiCuqVr0wmQuVtRP/9Ax957AQG36KFs
         W7d3qnEaTM5YYYkezQmB8cToYOZYmKxTie43HXmZYxwryHaZnQy0taHjGkQZ5D4onGnf
         N7PB41DuniDrU+Xr3mlYL2Wob1Qzj2G/vjf94pfHiEpTCDQSf/2dsOb79T0DPABT2ZLl
         9+aKmRFABSdtLriWYnIJWw3L2+14iE8L73rJ4g2+Bbrd2UtQtf6wNjgV/CKEPhcQHlg7
         XbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626868; x=1796231668;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e41widtp5DMmdFFeX2AWf3mpay/8eXwXnXNPU/S4dOI=;
        b=LQt9iOoWRM9WOtn/jsl/zoPIGvPZ8pU57D9DNGXBbFkWihtj/zqzkosPvKxlO/G4a2
         8PIMdMtiIoZE20yZquEZ6+k2itfJwZYyeM6hMtWFAXtDC0xKpdF7Yk0pVnu7xnWYU238
         EloFsGlFoP4We1wcphLrTQGbxX555OyCqM+8yAn01Aa1xxYbQVG9wSDSz4U+IF/eqzSU
         mecsPkicQUAm4pnh25rAiYD9GF301t54dnzVEkxOeLM65HCleu35l2r9HPGO4caNcEpj
         uMlw8uGQm5t/lc/bBZIZDxkj7KpjGeo8wmv9dnHaI7DqzGds3eDeIpVLzxq3WfF0DOrX
         uyqw==
X-Forwarded-Encrypted: i=1; AL+hErEb2Qhp5ppvc2sq/o6yh4NqOHAoowcZGLo1EyMWoRnDVVDSwLIsGqO8bPPmeQ/lQ3cRG/wsdhCdV8dK46fWuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9USOZfMoruB2tSEGltYyztLaIWYpKcFjkvWJ9UJbEOWrMeVWvt
	cgPBkGon9SLRuk8ZXOKYilV2VvX+GcrvvFyp6JfySvvLO36WFbMDKc+8LKk6xw==
X-Gm-Gg: AZFdTZeCJqQauDlf17/5M9HJlG2jNonyT5WBehGrBdMcQEX53nq2giBsWaRHkDAbgrC
	vP0aAxfHJLQQImAyYG+5xXfuoVBEcDmwjA3oRwAcw2oe/UfL6qUhu9MG8m8RpsnwS4D+okvecn1
	/DvLq1j0MHaQmt/zgoKyhnXQIgZzUPl5sFd1HkrTsqcPTXPiyq04k6RjbnpjMjqmAAsct0rYaG4
	ZbfIRlDPfH7mKf7oE97dpU63ykulsfnfjd3s4aigZuaay+Q8MZWhX0Nmf5nWMcioNWXyznezyPq
	n87rnMLlm2gsoEzdVn3iy5zVIu8ZaremjJmR8IxjU0QjROqb00xMVxZk7fr3k9m+KfIZJ2LiGtv
	WrwSAH16HpFCi+CrtkW8KnrJBS5e0GK6HQo2uFfLHqpalR+kNCsQVjqEfM44UyII1r/aoI1bwMD
	wR2kW+CDbKzGLFMjTKcRI0WTmb6ybN5d9b2dN/PidjL52ExiDxlKGQCvSH6rtmUXBYgZ/dBr8Ol
	CUQJnshMo70+5ck7A17kOutAcCkLNmnaXNOMmTy1m46p2NsLiqFVFbgaX6QZ8rXm7oqxPf2WkG2
	Xte62v6NfezoT0Wr2zuzKrN5gCbr6MTxJRscgb8=
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr398107485e9.13.1795626867730;
        Wed, 25 Nov 2026 09:14:27 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:11:8cbf:d366:a6fc:52dc:af7a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm244377725e9.3.2026.11.25.09.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:14:27 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] wifi: ath10k: add firmware feature bit to skip channel stats events
Date: Wed, 25 Nov 2026 18:13:29 +0100
Message-ID: <20261125171411.96431-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CAFEp6-3cQBaC1Ob1B8v8ZmQcMd_KfyABXxV81M9u0RkBY=Z0Ng@mail.gmail.com>
References: <20261121194939.3647400-1-morf3089@gmail.com> <20261121194939.3647400-2-morf3089@gmail.com> <CAFEp6-3cQBaC1Ob1B8v8ZmQcMd_KfyABXxV81M9u0RkBY=Z0Ng@mail.gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Loic,

On Wed, Nov 25, 2026 Loic Poulain wrote:
> Are we handling or using the CHAN_STAT_EVENT data in the driver? If
> so, which event handler or function currently consumes it?

Yes. With WMI_SCAN_CHAN_STAT_EVENT set, the firmware sends
WMI_TLV_CHAN_INFO_EVENTID for each scanned channel.
ath10k_wmi_event_chan_info() handles it and parses it with
ath10k_wmi_tlv_op_pull_ch_info_ev(). The default WCN3990
firmware-5.bin doesn't set single-chan-info-per-channel, so on SDM660
the event goes through ath10k_wmi_event_chan_info_paired(). That fills
ar->survey[] with noise floor, active time and busy time.

ath10k_get_survey() reports ar->survey[] to mac80211 for survey dump
and ACS.

With the bit set, survey data for scanned channels isn't populated on
these devices. I accept that to avoid the firmware crash on every scan.

Regards,
Gianluca
