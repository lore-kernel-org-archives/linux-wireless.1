Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880673;
	b=fGzIzIuXfnBjCGyPing5jO+Lu8JUGSqXSBFmFkd4TE/Frsl+ob1Gfc/l2G6xAmFmfCaE
	 d4Kf7QZT9Kun18FuniVs8FD+KflwZJ+lDO263Gx71QJV/wpWGZ2nCNt1Xsuj1wXNqCaDa
	 VHTXTwhuAZ6kG/APNfOmauwpJ0Oeo6uUxrqtxPEiUWc6sO6JsS/bZIVAOcKLXeh5BdH/O
	 D0q2TfDbXevuQgiNecEPzJmOL7dqEbnZgdBkJ1mkzEH1nOj+fjCWbpmTRXa6HYBvJ7KSR
	 gTb8WaguYafmFWHtz8Q3EHjAdiGZvHBNFeVaJLFKTVzXcDI8c7IdooBTHpbgu4cOQkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880673;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2f/ktswXZdv5qR8Igr+ohq/Et7cR/a3qMCjFZSBzBxk=;
	b=xGbRb0MQyXRto1dQM4PXgf0goJQS/NxQGWgs8jrBux3YhUk56bP/ZqPdILyIQS9RIWff
	 qY8WJ7Gx+KMB2q0ICdTf5WBt24FmAU0uQd5k8/iPfehxPSZ7K5h18arfIgY0t9hWGrYuq
	 TY64Eqewx4cYZrGiOOe1chLBj2iGFWn5OViWlDqb/ZSXCYqWXcbR0UBj4sw7i1egAmwPc
	 zxNYQmPl7XonwdRO33TTp1u71dQeM6ADYpvwyFxIVUjN4RHv06Zmg4kgMF06tLbsh2iVR
	 G6vjTidK7dXDLUs+vPS23Igo4LkYu0YACeM9z7zQrXxKo2JyCGBeIP6z5v9rAkJ6beg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kjnS9tPN;
	arc=none smtp.remote-ip=95.215.58.160
Received: from mta1.migadu.com (out-160.mta1.migadu.com [95.215.58.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C48A606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 15:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C48A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kjnS9tPN
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2f/ktswXZdv5qR8Igr+ohq/Et7cR/a3qMCjFZSBzBxk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795880670; v=1; x=1796485470;
 b=kjnS9tPNDvPYcHNc0QXeKpymtyfOxGsktK3mDyJxsStlSxrfTehGiB3ICHr/nasXg0i7jTTw
 ijn9Y494sL9Rqk3Vh89bTPnLyTKUelS+1CZPIU6wsovpA7ZQy3Khj2FJrFk++E7dIBTpqxwQ4Zt
 0cnURZnyOw0uv4mysdb30mDI=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d0f808bef8068c96;
	Sat, 28 Nov 2026 15:44:30 +0000
X-Mizu-Trace-ID: d0f808bef8068c96
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 16:44:28 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v5_6/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_88xxa=3A_correct_carrier-frequency_offset?=
In-Reply-To: <20261127180034.1058591-7-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-7-hjf3108@gmail.com>
Message-ID: <5E82B54A-7A38-45F9-A088-3733079219F1@linux.dev>
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

On November 27, 2026 7:00:26 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:
>Use the newly promoted helpers to implement CFO tracking for 88xxa.
>
>The PHY status of each received frame reports a CFO tail per RF path.
>The CFO tracking code averages them and corrects the offset if the
>offset is too large.
>
>RTL8814A has four RF paths, but reports a CFO tail only for paths A
>and B, so we only take the CFO tail of 2 paths.
>
>The crystal cap is 6 bits wide on all chips except RTL8822C. Obtain
>the correct value by masking it. For RTL8814A, use 0x20 if the
>the efuse is empty, like the vendor driver.
>
>Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
