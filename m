Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231669;
	b=Vkb3hRLHymPoPptcNLeXuT4E7sD5XYYc0svpe1NuIWcXD0TpUNOlmnSPojCYl5liuazn
	 O6IgVti9m+VeRX6WdxrftVMc9JgLobgLbRjTUdaiOVkC5TgV3KKQkegP7qy259Wlw59gN
	 +i7gJE1pm14nazxmE0y+h3xCUEnZ6JvBbZZmLpSSVlgtVNCj1PqiDNeyvrS+GkvtewaqL
	 3Cx1a+rfiMT5ToQiS9sMvG/QgjOOoaszcnzv7QesmI0xQHN7bu3W8wNc35+G7UhxzKRMi
	 jpiE6az66uZkyK8MNCUDuFjreGrYk0RZbuiFZcXuXl2XY4CGrYi0mC5zTkbBSXu2S3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=blQiJ56szd8Aj+2L+tyiAp3B9jqOehZ7BT3DC5KL+Bc=;
	b=StrMsRXZ8yDBhxyzBWDhdXL4I+ZJeaGlUZUKL/G4O0WhJhkqLHVJnN1qpgqHpF7Q6QpK
	 s77RjEOV7uOtuD9/kcGaRokHTuiThBQUy/+Z0XJT+ZqUdgiB2bhLzuQkcP0qDLmKTzkmU
	 XYv+S5vbvijaH2YT5d9zugDJWmpZhDCn0zhYmeq9IAh8G69cb/u+D+P3ScMdcsyHHCV6R
	 XVTnCBSYfV3Fuawl5y7a3tR5R9Lof5M1P0BiHqE4OIB/jmUVOrWQ6qg0fED6o2qFPo/xx
	 yL1h8yTuoHwuI+drT5Lb8mWHDvokXFNVifvMqADexiDyDkE9IZspbeGDibNBxP8DYgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tthTc67p;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693D9606A323
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 13:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693D9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tthTc67p
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b1ce85287aso833911c88.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 05:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231668; x=1794836468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blQiJ56szd8Aj+2L+tyiAp3B9jqOehZ7BT3DC5KL+Bc=;
        b=tthTc67psDOTl1gCn6etim2G3ZLrKljcUSB7HjK+Y92zKYrgH/7KmPbht0LrS9IXzd
         yNSinx3kwsO2wfLEutp6TAYuJGKMSuGoCf8xWiZR9MDGi1v2bzjD93se4D46UCAdkRbs
         GWyKOU74gPQyUOWfVHqKxn6N0U6YTa5I7krAn0pTqgAKbdOocEsBV+udTWW2Pq7ZPTsK
         /m+Ontn1jeIhbicVP0zj8BBUZkSU+sdNp/d+4Q5bqjxLFrBEgGWf0TGLIbcSG0cv8gs9
         f2so06NsUJqQJjDt+LLhsKvQ7mKqNO9lOQAEuqQHRQ+woWyEDnCJl91XrdMLaeV0ldxu
         XcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231668; x=1794836468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=blQiJ56szd8Aj+2L+tyiAp3B9jqOehZ7BT3DC5KL+Bc=;
        b=Rnvo2OFnjSJslta65i7sKtVRbkVInBOVjaBEAVH28cY7w8KSAcfLihwXww32DMBjRS
         p16fNh9ktApAJW1ujtxlc05FmqGGqZnGWy66YgA+E+jGkCVxCF1d0elIctihBn4bEP2t
         McozVvYSb3M/zx1mKvtgjpU7+JoAwu+UzMgZZE/HKL3KE6jwK+Q3zz3EpTL3194tSsz8
         +VZs0jzdX1WwvRWL/BJdz0znIu3tT8iIEWDba6SsPKLfVWvcL5cMEyOD+S4BtARJ8Yx1
         Aik1mTWqeIJeu4XRwDVIFHykePeNfGaVmKEYU1OhNUTzW+Ci/zipFPX6x7wCTg0Rf79e
         T4eQ==
X-Forwarded-Encrypted: i=1; AL+hErFTZucn9NQ49v+RnruZIPeVtwzg0rYDpRBC9f6qLEb0LvngkmDCiDMhnU880a/oqdl0oDDBbf8gYyD/Vsmnzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+cqw1fgLmWqYmAlTTBzUBI4ZTdACSJJGdMG33iukBvIIetqYf0
	FdQG1A2twECcUV1hEgg5WdUNdtxFwFthH1u2eKOiEok0mVU6gpVHm71P
X-Gm-Gg: AYBFou2bJ7EMNdgDAPlzSBE2HOihCH07B6mF7B0iWUVV5qQcU1LzK7BuYIhZLzmQbpo
	fJmq9QnYUWwey6fDkrdEtFTHyr8MGpmOylqxCc0OC/hePbRoEHraQigGZSG6MydA8NpVt571KH0
	ZKNj8x9gnZU1QWEflSiXEXDSsb1kc3XO5bGwo2p7j5Sv7SsksV/DYC2Je6ix59ehyoMGeJNbTR4
	Usp/7xwFkZFO8CxtD3W6Usg2kwGe8wxH2d3c25460gtgKmA1lLYaFbmHTECbVD/clE0uVLqwYdc
	+CCTtrsURogsYzQxOZ3/uM7qGp83hQGDtOHin9U767i/Duc6y6Ib8Pu4xgsN+bpdBl5DMYvpksT
	9qx0/VgkOdDwNZFNM0RwM/k7x3mog/7BYo1V/enuVhw4saBlyZFrSnj7rltGlqT6q3r5Wlm3gJ6
	akXX28M5tN9u8PXe0lSzC7+wr/uqCFVupIeBvEqUWfE5+uAQMaN5HweBx6u3I8/ubaSSbVZLK6/
	DMGn6CIZoJfW/H8ipUIN+N9cgv708PPS40FnM9WwELt49iVmtV13O0iwwXJqZYElWrkGFvFSFBN
	tV3UUBkf04SVXBViB+ULQcgnX7nSWhPZ/B18auPrsmzTl4TEpILlPZeE80tZhCuubCHiGIT26B9
	U1GtbpuA/yg==
X-Received: by 2002:a05:701b:2514:b0:185:b157:f271 with SMTP id a92af1059eb24-1b39feae9famr5928018c88.23.1794231668285;
        Mon, 09 Nov 2026 05:41:08 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5b1b:b08f:188d:9830])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375728f8bsm12144557c88.15.2026.11.09.05.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:41:07 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH rtw-next v2 5/7] wifi: rtw88: 88xxa: correct carrier-frequency offset
Date: Mon,  9 Nov 2026 21:39:16 +0800
Message-ID: <20261109134046.953116-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <05823fa0-08a8-4805-86c8-8f74af8f1a95@gmail.com>
References: <05823fa0-08a8-4805-86c8-8f74af8f1a95@gmail.com>
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

On Fri, Nov 06, 2026 at 07:59:44PM +0000, Bitterblue Smith wrote:
> On 06/11/2026 19:27, Luka Gejak wrote:
>> The 6 bit limit now shows up as 0x3F or 0x3f in five places across
>> rtw88xxa.c and rtw8814a.c. Maybe a define in rtw88xxa.h, which
>> rtw8814a.c includes too, similar to XCAP_MASK in rtw8822c.h.
>>
>
> This is the limit for every supported chip except RTL8822C. It can
> go somewhere in the core files.

Since this patch is 88xxa focused, I feel that it could be placed
within rtw88xxa.h for the time being. Since the cfo chip helpers
will be promoted to core for this series and I have a 8723bs, 
I can move the define to the core files in another patch series
to add cfo support to 8723bs if Luka isn't already working on it.
