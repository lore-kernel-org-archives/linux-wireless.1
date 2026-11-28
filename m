Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880638;
	b=1vI2crMfvRhW/4IPkEbIDyDJtye+I/W3YBxK9mq5nQT/Cjpbq8alxMCMdfM7fv88aw1s
	 ivnEClgDuFAzgO6VoqVbyR5Uhnz5DHg10J+4U1g27xAtvOJ6IHQViUEQ0RZhdvZePAUni
	 THUIHlY2VhCrTxM9boTXywXAKjKFDAm+ch8oDVvU4j7TGf/EKhBVn1/uPrUhu/bxPu0OF
	 sNZ0/ovGSfizyzB1l3MQlSHepZv4qPzviO+Z1UseQ08vOTjpEaxkntYJ4fUt1CMntbuWi
	 L9S6mwNLvkAMykSSdhLS2n64egQKMozylCD2RHJQ4HVzSNO0/vTI1YMyA8w3PGFlCtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880638;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3MGD82PgtF1+hP0dYglVCjxnBstzAwV+ZU2snOM3DNY=;
	b=zos504QBePZCk/6hk6xQWEKDFgtAYSe1Gd9BkKZ3XRu5T8UOfKS5xsHGwSmxZY0WvHYh
	 6nsg+XuWEo7vl36K4p2kgLGn3BXsK6bplhY11KZKm3tBmn9OjdSsrQS78txlg4At5PVrL
	 0CpH9EerbMBdGyMf/1s/wyJPRdmW94okmmfljhIR2ek3/hz4vbD9fTmwBL4IGHogr1fLy
	 8Al1p2m3tvaiXYOqqdlQPly8csQW6tOSf9PXAyNYwZjsTHPwjLaw9iODY/r41KL3KpZf3
	 b/9ZDQV8UXdEd93xIU9lznNrz9ViZkkC2DBD9ImKoO3WXZMFii7n5VFWNxxoRPD9HUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Vz2OwHzW;
	arc=none smtp.remote-ip=91.218.175.94
Received: from mta0.migadu.com (out-94.mta0.migadu.com [91.218.175.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD00606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 15:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD00606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Vz2OwHzW
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3MGD82PgtF1+hP0dYglVCjxnBstzAwV+ZU2snOM3DNY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795880635; v=1; x=1796485435;
 b=Vz2OwHzWKJFYimK0PD5NWOPtASCQQety36CkI5DGQfON0bI5PFt5p1zhpqhgylMyuhWZoXxw
 37DQ1URKHFpInvzbWhb0xrrpyhA+bsPsado44u0g3QH5RhSZGvcWrwCbGOC4HtPTRU//AZHivTE
 yvzuoCMEDzxnrhf+Drp4xrXc=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 56419d6c46ac8bc2;
	Sat, 28 Nov 2026 15:43:55 +0000
X-Mizu-Trace-ID: 56419d6c46ac8bc2
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 16:43:53 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v5_3/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_correctly_expose_beamformee_capabilities?=
In-Reply-To: <20261127180034.1058591-4-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-4-hjf3108@gmail.com>
Message-ID: <5475C916-B3C0-429B-8268-74EE77453611@linux.dev>
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

On November 27, 2026 7:00:23 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:
>Both SU and MU beamformee flags were set on every VHT chip,
>regardless of the chip limits bfer_su_max_num and bfer_mu_max_num.
>This is wrong when the chip does not support SU or MU beamformee.
>
>rtw_bf_assoc() also checks these flags. With an AP that is a MU
>beamformer, the MU flag makes it take the MU branch and return at
>bfer_mu_max_num, so a chip without MU support is never set up as a
>SU beamformee either.
>
>Make MU and SU capability flags each depend on the chip declared
>maximum instead of setting both flags together.
>
>Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
