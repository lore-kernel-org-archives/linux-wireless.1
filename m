Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795865402;
	b=rAftRHWO86whTow3c4aQo3hxaFQymPxORzFpY6zXLvl40p5L+C6sw3NiqY3xJJYY5Ja4
	 3QXK1coGGoyASWu9iwLUN8muJ20t04+V3RD13147wWWhzwATDDhaVQtlmUw6ue369szCT
	 +h9uljadM8idV8CRCRf2ca/8iIUruW8bAEr4yic55Jm/D+tsSrbF/mixQmme45mBHFniu
	 LQiqRyN6NBH3+QwW7NQprGgwHzSDEzDE5NcYjiaTj6Cp2Dpu+0FLiZnBGgAy/GR7W+EN3
	 OcCir9RJOpCsCvOVeaW8WUKTEQNhkcaFonKUsM5zxX6vAI79kQ8D5OnYnBz+gTP6xtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795865402;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=54o8OQ7UAsWgXirD5/FfrEDnJE17UGCWdqGGdVByD1Q=;
	b=wF/88lHhigdb9WDvUSTuLrcK47Np4QK41e/qg2osNjPp3dhoYif7ssbY/RnaJIfkKD63
	 itZlekoVAEv0QTzeRlF1lbDVnVAN/R0HdVe4qTc8ftnOvuCb+iR7ETGljTFJduB/Jez+J
	 eDakTl3VLqtHI75bi6MNRnr7wbwiJ7F2UeB4Yk0ZzVjUyyOwrZw3VynSPhRZXnVC1v9pQ
	 43UpyDBNUIvBv/6s6bEcBuRZULPN0f7+yzsOO9VQhFpfB+eM6ItQIZUmavYHjOsshGpxO
	 eNOG1wEuTrOpgITzJfERBByG2AbmUcPQ8DiSlyAUK8trudfKUK++D1EciJOfxqswMvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CsdyQIWx;
	arc=none smtp.remote-ip=91.218.175.93
Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D60606A323
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 11:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11D60606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CsdyQIWx
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fX9YjZlhFzjgQwAYsFF5NbPdefDEJIBnaNMJ6ZiqO6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795865399; v=1; x=1796470199;
 b=CsdyQIWx4V50LWg3DVqRwCy3SIy3UwNnQQLHIaOpvGP1j6he/mp4ZYXgCNeZXdxECc93Zv9g
 j1RclV5m+ebU2f1i+s4L0AwJztv2k7ln4SLals3uKtuKGiIEIFy+xipDzX9WNOGpmELqiPzcrgQ
 K0EJPDpoB9N+lGEhC7Wvj3KE=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bfd319335999c8e9;
	Sat, 28 Nov 2026 11:29:59 +0000
X-Mizu-Trace-ID: bfd319335999c8e9
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: Re: [PATCH rtw-next v5 7/7] wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits
Date: Sat, 28 Nov 2026 12:29:54 +0100
Message-ID: <179586537111.18963.13237902807035765522.rtw88-v5-reply@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127180034.1058591-8-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-8-hjf3108@gmail.com>
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

Hi Jie Feng,

Thanks for the patch. One comment below.

On November 28, 2026 2:00:27 AM GMT+08:00, Ho Jie Feng
<hjf3108@gmail.com> wrote:

> -	.set_ampdu_factor	= NULL,
> +	.set_ampdu_factor	= rtw8812a_set_ampdu_factor,

I think this only programs the byte limit when the adapter joins an AP.
The only caller of rtw_set_ampdu_factor() is the BSS_CHANGED_ASSOC
handler. An AP client goes through rtw_ops_sta_add() and
rtw_ops_ampdu_action(). Those paths leave the byte limit alone, even
with a single client. On a fresh AP start that leaves the value from
MAC initialization. The aggregate limit in the TX descriptor is an
MPDU count. The same applies to RTL8821A.

Is managed mode the intended scope here?

Best regards,
Luka Gejak
