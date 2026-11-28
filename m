Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880614;
	b=ktx0RwsFGoIbbVkyKy1v1xI74Lb8Dy2vHBCDEX9A1WsA0lnKPfrUzzzaEql3bvu58Er2
	 u8b9mCnm2+qNeoWy2eJJjYGqWufog3Ty2BFTZ+h+Xi3zdduIrmRajPcR0VDOzVIsr+R3d
	 b/wklOM3u4k2KYOZMzI6UAqR/VwV3Ho0vM711pRPN/C9TJQkDytKkwFO5MPxEeftNAxJx
	 8HM/9T/dhVzRzN+yukb+ofKwAh8jtm2a8OkXIdVGYlhak5Nw3lRZLzBrlnuDuNFRmuVhS
	 1eXX/ie/iaBg4PRSLNeZrwUdDHk22uG7mFkEraib/38yI5c8BPzSGJjJQdDahC091xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880614;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q445tZJBiJya+zvtjUatZ0o+kml3OwXzRmxGaCuDasg=;
	b=IqqZ20u5wsh8ZBM44gFfnZt1iF1VtS0hhlR5F0B8BWGjGGJ7Ap4k62fT8ljBzVtzmSo5
	 fbZ6V2D2Do9lWuTyw/HqxBkTIfPZIqRYtkSO0Z2fiUiRpGQWnWzc0V3TdCiq3LXxxpcHL
	 pTI5wCS9LSvHNvjeTyAqOfDL6X5lcEz+D4KS3NVGJxJydSFdMDw+FgfW0ujElVbyv4q8L
	 XjtkWrGwWcgGurNDGNGCsjvNQ1iYfOMufk2BkMMh9th5kfgMKa7mV5SaaLnmjN0l77X36
	 Xr1lAqqvUnAQUkHBHBZXZWkYH2cx5EyLGQSjZ1nVZf49SkSpTSpxSDqTVJv5xOZc5Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TcI18XXR;
	arc=none smtp.remote-ip=95.215.58.151
Received: from mta1.migadu.com (out-151.mta1.migadu.com [95.215.58.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E2606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 15:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F3E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TcI18XXR
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q445tZJBiJya+zvtjUatZ0o+kml3OwXzRmxGaCuDasg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795880611; v=1; x=1796485411;
 b=TcI18XXRtkDxBV39jojroiJJq1lTOVAy7exoSzTuXLVF4sRNeejHUmEVPz67X3t/9tAzFos/
 5gGi/8s5dgFKJv1rogvWQOoZofOPyzWuYNepaDCiFLPWdb8YKLQ4qOzhQAcnxH9gYnrci2eKFge
 JWhwmEGrKw/KVyc/oK0cx5T8=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f4aaf05ffc5cbea0;
	Sat, 28 Nov 2026 15:43:31 +0000
X-Mizu-Trace-ID: f4aaf05ffc5cbea0
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 16:43:30 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v5_1/7=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8814a=3A_enable_STBC_for_HT_transmissions?=
In-Reply-To: <20261127180034.1058591-2-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-2-hjf3108@gmail.com>
Message-ID: <F27C76B7-D651-4E5B-9A1F-D7E116E63363@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 27, 2026 7:00:21 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:
>8812a and 8814a support HT STBC, enable it. Previously, only
>VHT TX STBC was advertised, this patch enables STBC for HT too.
>
>8822c will lose reporting TX STBC capability if efuse reports
>only 1 path, but this is correct, since in that case it doesn't
>actually support STBC.
>
>Tested on RTL8812AU with an HT only AP, HT STBC packets were
>captured in monitor mode.
>
>Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
