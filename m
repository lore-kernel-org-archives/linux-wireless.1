Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983292;
	b=OxqLXO+F+02Kxl/7VbzTju9aBukCZWfC65wYA3slj+2+uvJIy5mUW/koJzzFJWTI/5wy
	 kLf6Z9f33SUsC5q9DAyRE/D88qoEMoGqCuFedP08jwGm8NwWZzR5VbltbI3opwQUkbiBl
	 DgTu2pLl+WhQXHwnLs7NvzMVnUlW72edYz1Iu8EuYgbGCNUj2NEMROxVyMmsy7zf9EVkx
	 z1RUN9NfC6kpeNg/WWCCRxmgbjXus0yxut79gJ/NPo4yqAQ8rQMgv0kCjiRYXnRoDFHhS
	 Zm3RDVD+UMGGeZXiPoQl8G1PUL7N/xORFdEEwG0YHo4eiH8/htqkU4PChKay1vqX3Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983292;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PTRbspw3RyygtvMTUBqnQVPHHrpmzYtZGAx+1ZE+gjI=;
	b=oDrJpOf9f+BocniuK3j66hDkovwVYkPaKJ5GL5GEIbbHqOymjSpMUCIGOEIZX3baMwM3
	 5H9cJpvckipMRnELEtGlT4U/5pDC0CCTjguNCD9zziHOPa2mGNGvHf28/pLcAPtuaXE4P
	 G/vZXDrVaEJ/sntznBl25qhoE6pdWshsMdtoel4cnx4BYCf8F/OkU0LE0VpyqUWjDp9Cj
	 jk/z0JKYgFhjDRH5QVMHNqqRuhQjbCnUI4jbEhIeRjS/gScGv0ObxVAJp5DUQZewfmCRv
	 MN+K3W5UrPdEQzeW8U6ecnCiJ6EpRnc+TyBXMYvAWU0K6E9I4KCTnJgFY/vYiV3eHbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FE+sgxxF;
	arc=none smtp.remote-ip=91.218.175.232
Received: from mta0.migadu.com (out-232.mta0.migadu.com [91.218.175.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A7606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FE+sgxxF
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o9kjdUB6DcxgcJ3VvL1GKBzttRCl5Zsq5XSdgiGyY+c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794983289; v=1; x=1795588089;
 b=FE+sgxxF33bEaz7auH2p9NYRKiv2eFzjddS0d+WSerVH0RyrPdQ2n7AYVPXMrKtVKdD/1g6U
 SYjJ3LScuGN8q1u2LcHY1cT9HEcOcQIpVRDoYpesOUPkUYgHC2jB9Vg0RGrFsOpjNzCKqTH47sK
 pJoktibcd8Em8fDD9vtuuOkc=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2c04411f336ef664;
	Wed, 18 Nov 2026 06:28:09 +0000
X-Mizu-Trace-ID: 2c04411f336ef664
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 07:28:04 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next=5D_wifi=3A_?=
 =?US-ASCII?Q?rtw88=3A_debug=3A_explicitly_cas?=
 =?US-ASCII?Q?t_to_u8_for_=2502x_format_in_?=
 =?US-ASCII?Q?rtw=5Fdebugfs=5Fget=5Ftx=5Fpwr=5Ftbl=28=29?=
In-Reply-To: <20261118025208.47465-1-pkshih@realtek.com>
References: <20261118025208.47465-1-pkshih@realtek.com>
Message-ID: <8F401FEB-9B40-471A-AA77-BB7094141F6A@linux.dev>
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

On November 18, 2026 3:52:08 AM GMT+01:00, Ping-Ke Shih
<pkshih@realtek.com> wrote:
>Explicitly cast to u8 to avoid smatch (with -p=kernel) warning:
>
>   warn: argument 4 to %02x specifier has type 'schar'
>
>Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
